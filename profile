# Put OS X specific settings in this file

# Look for GNU coreutils and man pages first
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman/:$MANPATH"

# Include .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
