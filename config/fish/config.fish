if status --is-interactive && type -q rbenv
  source (rbenv init -|psub)
end

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

function source_env --on-event fish_preexec
  if begin test -e '.env.development.local'; and not set -q ENV_SOURCED; end
    posix-source .env.development.local
    set -x ENV_SOURCED true
  end
end
