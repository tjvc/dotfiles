" Plugins

call plug#begin()

" General
Plug 'tpope/vim-sensible'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jamessan/vim-gnupg'

" Colorschemes
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" File navigation
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbrisbin/vim-mkdir'

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-endwise'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'github/copilot.vim'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" Development
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'

" Language-specific
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
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

" Search for current word
vnoremap <leader>w y:Ag <C-R><C-W><CR>
noremap <leader>w y1w:Ag <C-R><C-W><CR>

" Replace current word
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" Use tab for completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" LSP
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>

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

" HTML indentation
" TODO: Review
let g:html_indent_autotags = "html"
let g:html_indent_inctags = "head,body"

" Remove trailing whitespace on write
" TODO: Replace with ALE fixer?
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

" Plugin settings

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {'_': ['ale', 'buffer', 'tag']})
" Close preview window when completion is done
autocmd CompleteDone * silent! pclose!

" ALE
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1

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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "ruby", "javascript", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
