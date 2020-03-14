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

