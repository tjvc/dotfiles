# less
alias less="less -M"

# ls
alias ls='ls --color=auto'
alias ll='ls -alFh -I ".DS_Store" -I "._*"'
alias la='ls -A'
alias l='ls -CF'

# Rails
alias ss='bin/rails server'
alias sc='bin/rails console'

# Apache
alias apr='sudo service apache2 restart'
alias aps='sudo service apache2 start'
alias apst='sudo service apache2 stop'
alias apss='sudo service apache2 status'

# Tomcat7
alias tcr='sudo service tomcat7 restart'
alias tcs='sudo service tomcat7 start'
alias tcst='sudo service tomcat7 stop'
alias tcss='sudo service tomcat7 status'

# Git
alias gs='git status'
alias gb='git branch -a --color'
alias gd='git diff --color'
alias gc='git commit'
alias ga='git add'
alias gl='git log --pretty=oneline'
alias gps='git push'
alias gpl='git pull'
alias gco='git checkout'
alias grm='git rm'

# tmux
alias tm='tmux attach || tmux new'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
