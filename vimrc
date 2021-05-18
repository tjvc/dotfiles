" Plugins

call plug#begin()

" General
Plug 'tpope/vim-sensible'

" Colorschemes
Plug 'chriskempson/base16-vim'

" File navigation
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'],
  \ }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" Development
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" Language-specific
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go'

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
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Quickly insert debugger
nnoremap <Leader>y obinding.pry<ESC>

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

" Search for current word
vnoremap <leader>w y:Ag <C-R><C-W><CR>
noremap <leader>w y1w:Ag <C-R><C-W><CR>

" Use tab for completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Navigate quickfix list
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>p :cprev<CR>

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

" Plugin settings

" Use colorscheme set by base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" deoplete
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#source('_', 'max_menu_width', 200)
  call deoplete#custom#option('ignore_sources', {'_': ['around']})
end

" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
  \ 'ruby': ['bundle', 'exec', 'solargraph', 'stdio'],
  \ 'go': ['gopls']
  \ }
let g:LanguageClient_loggingFile = expand('~/.vim/LanguageClient.log')
let g:LanguageClient_loggingLevel = 'DEBUG'

" ALE
let g:ale_lint_on_text_changed="normal"
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=0
let g:ale_disable_lsp = 1
highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline

" splitjoin.vim
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_options_as_arguments = 1

" vim-go
let g:go_bin_path = $HOME."/go/bin"

" vim-prettier
let g:prettier#config#print_width = 80
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
