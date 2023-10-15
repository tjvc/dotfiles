local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup { capabilities = capabilities }
-- lspconfig.ruby_ls.setup { capabilities = capabilities }
lspconfig.gopls.setup { capabilities = capabilities }

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist)

-- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>o', function()
      vim.lsp.buf.format {
        -- Don't use tsserver for formatting
        -- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
        async = true,
        filter = function(client) return client.name ~= 'tsserver' end
      }
    end, opts)
  end,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
 vim.lsp.handlers.hover, {
   -- Set border for hover
   border = "single",
 }
)

vim.diagnostic.config {
  -- Set border for diagnostic floating windows
  float = { border = "single" },
  virtual_text = false,
}

-- null-ls
-- Integrate linters, formatters etc. with Neovim's LSP client
-- This plugin is being archived: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1621
local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.formatting.prettier.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.diagnostics.eslint.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.diagnostics.rubocop
}
null_ls.setup({ sources = sources })
