set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman (manpath | string split ":")

status --is-interactive; and source (rbenv init -|psub)

if status --is-interactive
  source $HOME/.config/base16-shell/profile_helper.fish
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

alias l='ls -CF'
alias ll='ls -alFh -I ".DS_Store" -I "._*"'

alias less="less -M"

if not set -q abbrs_initialized
  abbr ga 'git add'
  abbr gb 'git branch'
  abbr gc 'git commit -v'
  abbr gc! 'git commit -v --amend'
  abbr gco 'git checkout'
  abbr gd 'git diff'
  abbr gf 'git fetch'
  abbr gl 'git pull'
  abbr gp 'git push'
  abbr gst 'git status'
  abbr sc 'bin/rails console'
  abbr ss 'bin/rails server'

  set -U abbrs_initialized
end
set -g fish_user_paths "/usr/local/opt/node@8/bin" $fish_user_paths
