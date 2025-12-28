# Setup Instructions for Local Testing

## Ruby and Jekyll Installation

Ruby and Bundler are required to run Jekyll locally. Here are installation options:

### Option 1: Install Ruby via Package Manager (Linux/Fedora)

```bash
# For Fedora
sudo dnf install ruby ruby-devel gcc make

# Install Bundler
gem install bundler
```

### Option 2: Install Ruby via rbenv (Recommended)

```bash
# Install rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

# Add to your shell profile (~/.zshrc or ~/.bashrc)
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

# Install Ruby
rbenv install 3.2.0
rbenv global 3.2.0

# Install Bundler
gem install bundler
```

### Option 3: Use Docker (Alternative)

If you prefer not to install Ruby directly:

```bash
# Run Jekyll in Docker
docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -p 4000:4000 \
  -it jekyll/jekyll:latest \
  jekyll serve
```

## After Installing Ruby and Bundler

Once Ruby and Bundler are installed, run:

```bash
cd portfolio-website
bundle install
bundle exec jekyll serve
```

Then open your browser to: `http://localhost:4000`

## Alternative: Deploy Directly to GitHub Pages

If you prefer not to test locally, you can:

1. Push the code to GitHub
2. Enable GitHub Pages in repository settings
3. GitHub will automatically build and deploy the site

The site will be available at: `https://marcodejesus.github.io`

## Quick Check

To verify Ruby is installed:
```bash
ruby --version  # Should show Ruby 2.7 or higher
bundle --version  # Should show Bundler version
```
