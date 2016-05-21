" execute pathogen#infect()

set nocompatible
filetype off

" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'

" File navigation

Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

" Editing

Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'ap/vim-templates'
Plugin 'tpope/vim-repeat'

" For specific filetypes/applications

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'shime/vim-livedown'
Plugin 'Valloric/MatchTagAlways'
Plugin 'vim-scripts/HTML-AutoCloseTag'

call vundle#end()

" Syntax highlighting
syntax on

" Filetype detection, filetype plugins, indent scripts
filetype plugin indent on

" Solarized
set background=dark
colorscheme solarized

" Soft tabs, two spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Show line numbers
set number

" Break lines on word boundaries
set linebreak

" Filetype for .md is Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" This lets me copy text to the system clipboard on OS X
set clipboard=unnamed

" Syntax highlighting for Markdown is buggy, so disable it
autocmd Filetype markdown setlocal syntax=OFF

" Remove trailing whitespace on write
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" statusline

set statusline=%< " where to truncate line if too long
set statusline+=%f\  " path to the file in the buffer
set statusline+=%{fugitive#statusline()} " Git branch
set statusline+=%y " filetype
set statusline+=[%{&ff}] " file format
set statusline+=%{strlen(&fenc)?'['.&fenc.']':''} " file encoding
set statusline+=%r " readonly flag
set statusline+=%m " modified flag
set statusline+=%= " separation point between left and right aligned items
set statusline+=%-14.(%l,%c%V%)\ " line number, column number (left aligned, minimum width 14)
set statusline+=%P " percentage through file

" Key bindings

" Type :w!! to save file as superuser
cmap w!! w !sudo tee >/dev/null %

" Unbind cursor keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" C-s saves
nmap <C-s> :w<CR>
vmap <C-s> <Esc><C-s>gv
imap <C-s> <Esc><C-s>

" Use jj to exit insert mode
inoremap jj <Esc>
