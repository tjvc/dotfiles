if status --is-interactive && type -q rbenv
  source (rbenv init -|psub)
end

if status --is-interactive && type -q nodenv
  source (nodenv init -|psub)
end

if status --is-interactive
  source $HOME/.config/base16-shell/profile_helper.fish
end

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
