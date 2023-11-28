require("catppuccin").setup({
  integrations = {
    gitgutter = true
  }
})

 -- latte, frappe, macchiato, mocha
vim.g.catppuccin_flavour = "macchiato"

vim.cmd.colorscheme("catppuccin")
