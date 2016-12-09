#!/bin/bash
#
# Create symlinks to dotfiles

ln -sf ~/dotfiles/bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/dircolors ~/.dircolors
ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/irbrc ~/.irbrc
ln -sf ~/dotfiles/irbrc_rails ~/.irbrc_rails
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc

# Directories

[[ ! -d ~/.bin ]] && ln -s ~/dotfiles/bin ~/.bin
[[ ! -d ~/.git-templates ]] && ln -s ~/dotfiles/git-templates ~/.git-templates
[[ ! -d ~/.tmuxinator ]] && ln -s ~/dotfiles/tmuxinator ~/.tmuxinator

mkdir -p ~/.config
[[ ! -d ~/.config/base16-shell ]] && ln -s ~/dotfiles/config/base16-shell ~/.config/base16-shell

mkdir -p ~/.vim
[[ ! -d ~/.vim/colors ]] && ln -s ~/dotfiles/vim/colors ~/.vim/colors
