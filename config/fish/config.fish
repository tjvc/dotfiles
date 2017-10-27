set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman (manpath | string split ":")

status --is-interactive; and source (rbenv init -|psub)

if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end

eval (dircolors -c ~/.dircolors)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stateseparator ''

function fish_prompt
  set_color cyan
  printf (prompt_pwd)
  set_color yellow
  printf '%s' (__fish_git_prompt)
  set_color normal
  printf ' > '
end

alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'

alias g='git'

alias l='ls -CF'
alias ll='ls -alFh -I ".DS_Store" -I "._*"'

alias less="less -M"

alias ss='bin/rails server'
alias sc='bin/rails console'
