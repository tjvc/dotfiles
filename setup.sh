#!/bin/bash

ln -sf ~/dotfiles/bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/ctags ~/.ctags
ln -sf ~/dotfiles/dircolors ~/.dircolors
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/profile ~/.profile
ln -sf ~/dotfiles/pryrc ~/.pryrc
ln -sf ~/dotfiles/rubocop.yml ~/.rubocop.yml
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc

[ ! -d ~/.bin ] && ln -s ~/dotfiles/bin ~/.bin
[ ! -d ~/.git-templates ] && ln -s ~/dotfiles/git-templates ~/.git-templates

mkdir -p ~/.config
[ ! -d ~/.config/base16-shell ] && ln -s ~/dotfiles/config/base16-shell ~/.config/base16-shell
[ ! -d ~/.config/fish ] && ln -s ~/dotfiles/config/fish ~/.config/fish
[ ! -d ~/.config/nvim ] && ln -s ~/dotfiles/config/nvim ~/.config/nvim

source ~/.profile

sudo sh -c "grep -q -F '/usr/local/bin/fish' /etc/shells || echo '/usr/local/bin/fish' >> /etc/shells"
