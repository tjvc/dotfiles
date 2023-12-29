local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>w', builtin.grep_string, {})
vim.keymap.set('n', '<leader>a', function() builtin.grep_string({ search = vim.fn.input('>') }) end)
vim.keymap.set('n', '<leader>g', builtin.tags, {})
vim.keymap.set('n', '<leader>h', builtin.oldfiles, {})

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<Esc>'] = 'close',
      },
    },
    scroll_strategy = 'limit',
    path_display = { 'truncate' },
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
    },
  },
}
