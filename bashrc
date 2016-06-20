# Don't do anything if not running interactively
if [[ $- != *i* ]] ; then
  return
fi

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# Enable programmable completion features (you don't need to enable
# this if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc)
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Append to the history file, don't overwrite it
shopt -s histappend

# Ignore duplicate commands and whitespace in history
HISTCONTROL=ignoreboth

# Lines of history to keep in memory
HISTSIZE=5000

# Lines of history to keep in file
HISTFILESIZE=1000000

# Add timestamps to history
HISTTIMEFORMAT='%F %T '

# Get git branch to include in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Set user and hostname color in prompt (red on production servers)
if [[ $(hostname) == *prod* ]]; then
  uh_color="0;31m"
else
  uh_color="00;32m"
fi

# Coloured prompt
PS1="\[\033[$uh_color\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "

# Show hostname in iTerm tab title
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}\007"'

# Predictable SSH authentication socket location
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# Enable tab-completion for hosts in SSH config
if [ -f ~/.ssh/config ]; then
  complete -W "$(echo `cat ~/.ssh/config | grep Host | cut -d ' ' -f 2 | grep -v '^$'`)" ssh
fi

# Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Set ls colors
eval $(dircolors ~/.dircolors)

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Use ctrl+s in vim
vim()
{
  local STTYOPTS="$(stty --save)"
  stty stop '' -ixoff
  command vim "$@"
  stty "$STTYOPTS"
}

# Include .bash_aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
