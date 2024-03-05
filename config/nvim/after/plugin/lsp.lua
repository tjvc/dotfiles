-- UI

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'single',
  }
)

vim.diagnostic.config {
  float = { border = 'single' },
  virtual_text = false,
  severity_sort = true,
}

local signs = { 'Error', 'Warn', 'Hint', 'Info' }
for _, sign in ipairs(signs) do
  local hl = 'DiagnosticSign' .. sign
  vim.fn.sign_define(hl, { texthl = hl, text = '•' })
end

-- Mappings

vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setqflist)

local format_buf = function()
  vim.lsp.buf.format {
    filter = function(client)
      return client.name ~= 'tsserver'
    end,
  }
  -- https://github.com/neovim/neovim/issues/25014
  vim.diagnostic.show()
end

local augroup = vim.api.nvim_create_augroup('lsp_format', {})

local set_buf_lsp_mappings = function(bufnr)
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
end

local set_buf_format_mapping = function(bufnr)
  vim.keymap.set('n', '<Leader>o', format_buf, { buffer = bufnr })
end

local create_buf_format_on_save_autocmd = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = format_buf,
  })
end

local on_attach = function(_, bufnr)
  set_buf_lsp_mappings(bufnr)
  set_buf_format_mapping(bufnr)
  create_buf_format_on_save_autocmd(bufnr)
end

-- Language servers

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TODO: Support LSP snippets (requires a snippet engine)
-- https://github.com/hrsh7th/nvim-cmp/issues/304
capabilities['textDocument']['completion']['completionItem']['snippetSupport'] = false

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = vim.loop.cwd,
}

lspconfig.gopls.setup { capabilities = capabilities, on_attach = on_attach }

lspconfig.lua_ls.setup(
  {
    cmd = {
      -- Work around Homebrew multi-user permissions
      'lua-language-server',
      '--logpath=/tmp/lua-language-server/log',
      '--metapath=/tmp/lua-language-server/meta',
    },
    capabilities = capabilities,
    on_attach = on_attach,
  }
)

local null_ls = require('null-ls')
local sources = {
  null_ls.builtins.diagnostics.eslint.with({
    prefer_local = 'node_modules/.bin',
  }),
  null_ls.builtins.formatting.prettier.with({
    prefer_local = 'node_modules/.bin',
  }),
  null_ls.builtins.diagnostics.rubocop,
}
null_ls.setup({
  -- debug = true,
  sources = sources,
  on_attach = function(_, bufnr)
    set_buf_format_mapping(bufnr)
    create_buf_format_on_save_autocmd(bufnr)
  end,
})

-- vim.lsp.set_log_level('debug')
