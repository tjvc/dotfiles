if status --is-interactive && type -q rbenv
  source (rbenv init -|psub)
end

status --is-interactive; and source (nodenv init -|psub)

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
