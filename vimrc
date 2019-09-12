set nocompatible
filetype off

" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" General
Plugin 'tpope/vim-sensible'

" Colorschemes
Plugin 'chriskempson/base16-vim'

" File navigation
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Editing
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'AndrewRadev/splitjoin.vim'

" For specific filetypes/applications
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'janko-m/vim-test'
Plugin 'w0rp/ale'

call vundle#end()

" Key bindings

let mapleader = " "

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

" Use jj to exit insert mode
inoremap jj <Esc>

" Disable default command-line window key binding
nnoremap q: <NOP>
vnoremap q: <NOP>

" test.vim mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Quickly insert debugger
nnoremap <Leader>p obinding.pry<ESC>

" fzf mappings
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Tags<CR>
nnoremap <Leader>a :Ag<Space>

" Clear buffers
nnoremap <Leader>x :silent :bufdo bd<CR>

" Reload buffers
nnoremap <Leader>r :checkt<CR>

" Vim settings

" Syntax highlighting
syntax on

" Filetype detection, filetype plugins, indent scripts
filetype plugin indent on

" Soft tabs, two spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Hybrid line numbers
set relativenumber
set number

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Break lines on word boundaries
set linebreak

" Use par for paragraph formatting
" http://vimcasts.org/episodes/formatting-text-with-par/
set formatprg=par

" HTML indentation
let g:html_indent_autotags = "html"
let g:html_indent_inctags = "head,body"

" Remove trailing whitespace on write
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" netrw
let g:netrw_banner = 0

" Open new split panes to bottom and right, which feels more natural
set splitbelow
set splitright

" Use Ag over Grep
set grepprg=ag\ --nogroup\ --nocolor

" Automatically :write before running commands
set autowrite

" Set shell
set shell=/bin/bash

set confirm

" Plugin settings

" Use colorscheme set by base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_lint_on_text_changed="normal"
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=0

" splitjoin.vim
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
