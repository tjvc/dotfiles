-- Consider predicate methods as words
vim.o.iskeyword = vim.o.iskeyword .. ',?'

vim.keymap.set('n', 'gd', ':tjump <C-R><C-W><CR>', { buffer = true })
