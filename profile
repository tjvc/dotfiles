# This file is read by login shells. Use it to for configuration values that
# apply to the whole session.

# Look for Homebrew-installed GNU coreutils and man pages first
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman/:"

# Add ~/bin to PATH for custom scripts
PATH="$HOME/bin:$PATH"

# Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

# Remove duplicate entries from PATH
# https://unix.stackexchange.com/a/124517
PATH=$(printf %s "$PATH" | awk -v RS=: '!a[$0]++' | paste -s -d:)

export EDITOR='vim'
export PATH
export MANPATH

# Include .bashrc
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi
