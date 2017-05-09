# Put OS X specific settings in this file

# Look for GNU coreutils and man pages first
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman/:$MANPATH"

# Show hostname in iTerm tab title
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}\007"'

# Include .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
