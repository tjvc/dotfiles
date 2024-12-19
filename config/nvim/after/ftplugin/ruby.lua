-- Consider predicate methods as words
vim.o.iskeyword = vim.o.iskeyword .. ',?'

vim.keymap.set('n', '<Leader>p', 'obinding.pry<ESC>', { buffer = true })
