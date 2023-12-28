call plug#begin()

" General
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jamessan/vim-gnupg'
Plug 'nvim-lua/plenary.nvim'

" Colorschemes
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" File navigation
Plug 'pbrisbin/vim-mkdir'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

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
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'nvim-treesitter/nvim-treesitter-context'

" Language-specific
Plug 'tpope/vim-rails'

call plug#end()
