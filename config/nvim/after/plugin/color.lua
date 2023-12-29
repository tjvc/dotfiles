require('catppuccin').setup({
  integrations = {
    gitgutter = true,
  },
})

vim.g.catppuccin_flavour = 'macchiato'

vim.cmd.colorscheme('catppuccin')
