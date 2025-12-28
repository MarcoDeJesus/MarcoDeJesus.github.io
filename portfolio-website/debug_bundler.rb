#!/usr/bin/env ruby
# Debug script to diagnose why bundle exec jekyll serve fails

require 'json'
require 'fileutils'

LOG_PATH = '/home/marcodejesus/Documents/Projects/AI/Responder/.cursor/debug.log'
SESSION_ID = 'debug-session'
RUN_ID = 'run1'

def log(hypothesis_id, message, data = {})
  entry = {
    id: "log_#{Time.now.to_f}_#{rand(1000)}",
    timestamp: (Time.now.to_f * 1000).to_i,
    location: "debug_bundler.rb",
    message: message,
    data: data,
    sessionId: SESSION_ID,
    runId: RUN_ID,
    hypothesisId: hypothesis_id
  }
  
  File.open(LOG_PATH, 'a') do |f|
    f.puts(entry.to_json)
  end
rescue => e
  # Silently fail if logging fails
end

# Hypothesis A: PATH issue - gem executables not in PATH
log('A', 'Checking PATH environment variable', { path: ENV['PATH'] })
log('A', 'Checking if jekyll is in PATH', { 
  in_path: system('which jekyll > /dev/null 2>&1'),
  which_output: `which jekyll 2>&1`.chomp
})

# Hypothesis B: Bundler binstubs missing
log('B', 'Checking for binstubs directory', { 
  binstubs_exists: File.directory?('.bundle/bin'),
  bin_exists: File.directory?('bin')
})
log('B', 'Checking for jekyll binstub', {
  binstub_exists: File.exist?('.bundle/bin/jekyll') || File.exist?('bin/jekyll')
})

# Hypothesis C: RubyGems bin directory not in PATH
gem_env = `gem env 2>&1`
log('C', 'RubyGems environment', { gem_env: gem_env })
if gem_env =~ /EXECUTABLE DIRECTORY: (.+)/
  exec_dir = $1.strip
  log('C', 'Gem executable directory', { 
    directory: exec_dir,
    in_path: ENV['PATH'].include?(exec_dir),
    jekyll_exists: File.exist?(File.join(exec_dir, 'jekyll'))
  })
end

# Hypothesis D: Bundler configuration issue
bundle_config = `bundle config list 2>&1`
log('D', 'Bundler configuration', { config: bundle_config })
if File.exist?('.bundle/config')
  log('D', 'Bundler config file contents', { 
    contents: File.read('.bundle/config')
  })
end

# Hypothesis E: Bundler path/version mismatch
log('E', 'Bundler version', { version: `bundle --version 2>&1`.chomp })
log('E', 'Ruby version', { version: `ruby --version 2>&1`.chomp })
log('E', 'Checking where bundler installs gems', {
  bundle_path: `bundle show jekyll 2>&1`.chomp
})

# Check if jekyll gem is actually installed
log('E', 'Checking jekyll gem installation', {
  gem_list: `gem list jekyll 2>&1`.chomp,
  bundle_show: `bundle show jekyll 2>&1`.chomp
})

# Try to find jekyll executable in common locations
common_paths = [
  File.join(Dir.home, '.gem', 'bin'),
  File.join(Dir.home, '.local', 'share', 'gem', 'ruby'),
  '/usr/local/bin',
  '/usr/bin',
  File.join(Dir.home, 'bin')
]

common_paths.each do |path|
  if File.directory?(path)
    jekyll_path = File.join(path, 'jekyll')
    log('E', 'Checking common path for jekyll', {
      path: path,
      exists: File.exist?(jekyll_path),
      executable: File.exist?(jekyll_path) && File.executable?(jekyll_path)
    })
  end
end

# Check bundle exec path resolution
log('E', 'Testing bundle exec path resolution', {
  bundle_which: `bundle exec which jekyll 2>&1`.chomp,
  bundle_show_path: `bundle show --paths jekyll 2>&1`.chomp
})

puts "Debug information logged to #{LOG_PATH}"
puts "Run: cat #{LOG_PATH} | jq -s '.' to view formatted logs"
