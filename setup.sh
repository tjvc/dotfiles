#!/bin/bash

ln -sf ~/dotfiles/bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/dircolors ~/.dircolors
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/profile ~/.profile
ln -sf ~/dotfiles/pryrc ~/.pryrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc

[ ! -d ~/.bin ] && ln -s ~/dotfiles/bin ~/.bin
[ ! -d ~/.git-templates ] && ln -s ~/dotfiles/git-templates ~/.git-templates

mkdir -p ~/.config
[ ! -d ~/.config/base16-shell ] && ln -s ~/dotfiles/config/base16-shell ~/.config/base16-shell

source ~/.profile