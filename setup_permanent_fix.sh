#!/bin/bash
# Permanent fix: Add /home/marcodejesus/bin to PATH in shell profile

SHELL_PROFILE=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_PROFILE="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_PROFILE="$HOME/.bashrc"
elif [ -f "$HOME/.bash_profile" ]; then
    SHELL_PROFILE="$HOME/.bash_profile"
fi

if [ -n "$SHELL_PROFILE" ]; then
    # Check if already added
    if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$SHELL_PROFILE"; then
        echo "" >> "$SHELL_PROFILE"
        echo "# Add gem executables to PATH" >> "$SHELL_PROFILE"
        echo 'export PATH="$HOME/bin:$PATH"' >> "$SHELL_PROFILE"
        echo "Added PATH export to $SHELL_PROFILE"
        echo "Run: source $SHELL_PROFILE (or restart your terminal)"
    else
        echo "PATH already configured in $SHELL_PROFILE"
    fi
else
    echo "Could not find shell profile. Please manually add to your shell config:"
    echo 'export PATH="$HOME/bin:$PATH"'
fi
