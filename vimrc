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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

" Editing
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" For specific filetypes/applications
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'

call vundle#end()

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

" Use jj to exit insert mode
inoremap jj <Esc>

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
set statusline+=%-14.(%l,%c%V%)\  " line number, column number (left aligned, minimum width 14)
set statusline+=%P " percentage through file
set statusline+=\ %{SyntasticStatuslineFlag()}

" syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Default checkers are defined in plugin/syntastic/registry.vim
let g:syntastic_javascript_checkers = [ "jshint" ]
let g:syntastic_ruby_checkers = [ "mri", "rubocop" ]

let g:syntastic_javascript_jslint_args =
  \ "--white --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars --browser --predef $"

" Misc

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

" Hybrid line numbers
set relativenumber
set number

" Show ruler at 80 columns
set colorcolumn=80

" Break lines on word boundaries
set linebreak

" Filetype for .md is Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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

" Exclude vendor directory from CtrlP results
let g:ctrlp_custom_ignore = { 'dir': '\v/vendor$' }

" MacVim
set guifont=Menlo\ Regular:h13
set guioptions=gm

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
