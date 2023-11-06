set -gx fish_greeting
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

set -gx EDITOR vim
set -gx FZF_DEFAULT_COMMAND fd --type f

set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# Prevent ASDF from setting fish_user_paths as a global variable
# https://github.com/asdf-vm/asdf/issues/1629
fish_add_path "$ASDF_DIR/bin"
fish_add_path "$HOME/.asdf/shims"

if status --is-interactive && type -q asdf
  source (brew --prefix asdf)/libexec/asdf.fish
end

fish_add_path ~/bin

# https://github.com/asdf-vm/asdf-nodejs#partial-and-codename-versions
set -Ux ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY latest_installed
