runtime plug.vim
runtime map.vim

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

" Make it obvious where 120 characters is
" TODO: Make this project-specific
set textwidth=120
set colorcolumn=+1

" Break lines on word boundaries
set linebreak

" Use par for paragraph formatting
" http://vimcasts.org/episodes/formatting-text-with-par/
set formatprg=par

" Disable search highlighting
set nohlsearch

" Load trusted local config files
" TODO: Is this needed now we have .nvim.lua?
set exrc

set noswapfile

" HTML indentation
" TODO: Review
let g:html_indent_autotags = "html"
let g:html_indent_inctags = "head,body"

" Remove trailing whitespace on write
" TODO: Is this still the best approach?
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

" Underline search matches
highlight Search ctermbg=none ctermfg=none cterm=underline

" Highlight current line
set cursorline

" Disable mouse
set mouse=
