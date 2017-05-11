# This file is read by login shells. Use it to for configuration values that
# apply to the whole session.

# Idempotently update PATH
update_path() { case ":${PATH:=$1}:" in *:$1:*) ;; *) PATH="$1:$PATH" ;; esac; }

# Look for Homebrew-installed GNU coreutils and man pages first
update_path '/usr/local/opt/coreutils/libexec/gnubin'
export MANPATH='/usr/local/opt/coreutils/libexec/gnuman/:'

# Add ~/bin to PATH for custom scripts
update_path "$HOME/bin"

# Added by the Heroku Toolbelt
update_path '/usr/local/heroku/bin'

export EDITOR='vim'

# Include .bashrc
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi
