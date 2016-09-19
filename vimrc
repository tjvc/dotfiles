set nocompatible
filetype off

" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'

" Colorschemes

Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'

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
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'shime/vim-livedown'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-ragtag'

call vundle#end()

" Syntax highlighting
syntax on

" Filetype detection, filetype plugins, indent scripts
filetype plugin indent on

" Colorscheme
set background=dark
let base16colorspace=256
colorscheme base16-default-dark

" Soft tabs, two spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Show line numbers
set number

" Show ruler at 80 columns
set colorcolumn=80

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
" set statusline+=%-14.(%l,%c%V%)\ " line number, column number (left aligned, minimum width 14)
set statusline+=%P " percentage through file
set statusline+=\ %{SyntasticStatuslineFlag()}

" syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = [ "mri", "rubocop" ]

let g:syntastic_javascript_jslint_args =
  \ "--white --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars --browser --predef $"

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
