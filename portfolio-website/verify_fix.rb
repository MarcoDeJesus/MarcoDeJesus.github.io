#!/usr/bin/env ruby
# Verification script to test if the fix works

require 'json'
require 'fileutils'

LOG_PATH = '/home/marcodejesus/Documents/Projects/AI/Responder/.cursor/debug.log'
SESSION_ID = 'debug-session'
RUN_ID = 'post-fix'

def log(hypothesis_id, message, data = {})
  entry = {
    id: "log_#{Time.now.to_f}_#{rand(1000)}",
    timestamp: (Time.now.to_f * 1000).to_i,
    location: "verify_fix.rb",
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

# Test if jekyll is now accessible
log('VERIFY', 'Testing PATH after fix', { path: ENV['PATH'] })
log('VERIFY', 'Testing jekyll in PATH', { 
  in_path: system('which jekyll > /dev/null 2>&1'),
  which_output: `which jekyll 2>&1`.chomp
})

# Test bundle exec jekyll
log('VERIFY', 'Testing bundle exec jekyll --version', {
  success: system('bundle exec jekyll --version > /dev/null 2>&1'),
  output: `bundle exec jekyll --version 2>&1`.chomp
})

# Check if binstubs were created
log('VERIFY', 'Checking for binstubs', {
  bin_dir_exists: File.directory?('bin'),
  jekyll_binstub_exists: File.exist?('bin/jekyll'),
  jekyll_binstub_executable: File.exist?('bin/jekyll') && File.executable?('bin/jekyll')
})

# Test direct binstub execution
if File.exist?('bin/jekyll')
  log('VERIFY', 'Testing direct binstub execution', {
    success: system('./bin/jekyll --version > /dev/null 2>&1'),
    output: `./bin/jekyll --version 2>&1`.chomp
  })
end

puts "Verification logged to #{LOG_PATH}"
