#!/bin/bash

ln -sf ~/dotfiles/ctags ~/.ctags
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore-global ~/.gitignore-global
ln -sf ~/dotfiles/pryrc ~/.pryrc
ln -sf ~/dotfiles/rubocop.yml ~/.rubocop.yml
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/Brewfile ~/Brewfile
ln -sf ~/dotfiles/asdfrc ~/.asdfrc

[ ! -d ~/.git-templates ] && ln -s ~/dotfiles/git-templates ~/.git-templates

mkdir -p ~/bin
for file in ~/dotfiles/bin/*; do
  [ -f "$file" ] && ln -sf "$file" ~/bin
done

mkdir -p ~/.config
[ ! -d ~/.config/alacritty ] && ln -s ~/dotfiles/config/alacritty ~/.config/alacritty
[ ! -d ~/.config/fish ] && ln -s ~/dotfiles/config/fish ~/.config/fish
[ ! -d ~/.config/nvim ] && ln -s ~/dotfiles/config/nvim ~/.config/nvim

sudo sh -c "grep -q -F '/opt/homebrew/bin/fish' /etc/shells || echo '/opt/homebrew/bin/fish' >> /etc/shells"
