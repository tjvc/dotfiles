runtime plug.vim
runtime map.vim

" Soft tabs, two spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Hybrid line numbers
set relativenumber
set number

" Make it obvious where 120 characters is
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
set exrc

set noswapfile

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

" Automatically :write before running commands
set autowrite

" Highlight current line
set cursorline

" Disable mouse
set mouse=
