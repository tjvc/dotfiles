# This file is read by interactive non-login Bash shells, and is sourced by
# ~/.profile for login Bash shells. Use it for configuration values that only
# apply to interactive Bash sessions.

# Don't do anything if not running interactively
if [[ $- != *i* ]]; then
  return
fi

### History ###

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

### Completion ###

# Enable programmable completion features (Ubuntu only)
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable tab completion for hosts in SSH config
if [ -f ~/.ssh/config ]; then
  complete -W "$(echo $(cat ~/.ssh/config | grep Host | cut -d ' ' -f 2 | grep -v '^$'))" ssh
fi

# Enable tab completion for Homebrew-installed git
if command -v brew &> /dev/null; then
  if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
    . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
  fi
fi

### Prompt ###

# Get git branch to include in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Coloured prompt
PS1="\[\033[00;32m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "

### Includes ###

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
[ -s $BASE16_SHELL ] && source $BASE16_SHELL

# tmuxinator
source ~/.bin/tmuxinator.bash

# .bash_aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

### Misc ###

# Check the window size after each command
shopt -s checkwinsize

# Predictable SSH authentication socket location
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# Show hostname in iTerm tab title
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}\007"'

# Set ls colors
command -v dircolors &> /dev/null && eval $(dircolors ~/.dircolors)
