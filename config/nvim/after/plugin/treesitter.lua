require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'ruby', 'javascript' },
  auto_install = true,

  highlight = {
    enable = true,
  },
}
