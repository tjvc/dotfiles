" Plugins

call plug#begin()

" General
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jamessan/vim-gnupg'
Plug 'nvim-lua/plenary.nvim'

" Colorschemes
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" File navigation
Plug 'pbrisbin/vim-mkdir'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-endwise'
Plug 'github/copilot.vim'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" Development
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'janko-m/vim-test'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mxsdev/nvim-dap-vscode-js'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Language-specific
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

call plug#end()

" Key bindings

let mapleader = " "

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
" TODO: What is this?
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Quickly insert debugger
nnoremap <Leader>p obinding.pry<ESC>

" Clear buffers
nnoremap <Leader>x :silent :bufdo bd<CR>

" Replace current word
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" Remap macro key
nnoremap Q q
nnoremap q <Nop>

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

" Plugin settings

" splitjoin.vim
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_options_as_arguments = 1

" vim-go
let g:go_bin_path = $HOME."/go/bin"

let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha

lua << EOF
require("catppuccin").setup()
EOF

set termguicolors
colorscheme catppuccin
