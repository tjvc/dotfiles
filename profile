# Put OS X specific settings in this file

# Look for GNU coreutils and man pages first
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman/:"

# Show hostname in iTerm tab title
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}\007"'

# Enable tab completion for Homebrew-installed git
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# Include .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
