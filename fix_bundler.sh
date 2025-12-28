#!/bin/bash
# Fix script to add /home/marcodejesus/bin to PATH and configure bundler binstubs

# Add to PATH for current session
export PATH="$HOME/bin:$PATH"

# Configure bundler to use binstubs
bundle config set --local path 'vendor/bundle'
bundle config set --local bin 'bin'

# Install binstubs
bundle install --binstubs

echo "Fix applied:"
echo "1. Added $HOME/bin to PATH for this session"
echo "2. Configured bundler to use binstubs in ./bin directory"
echo ""
echo "Now try: bundle exec jekyll serve"
