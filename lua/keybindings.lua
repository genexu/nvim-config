local builtin = require('telescope.builtin')
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('v', '<C-f>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', opts)

-- Buffer navigation
map('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- NvimTree
map('n', '<C-e>', 'y<ESC>:NvimTreeToggle<CR>', opts)
map('n', '<leader>nf', '<Cmd>NvimTreeFindFile<CR>', opts)
map('n', '<leader>nc', '<Cmd>NvimTreeCollapse<CR>', opts)

-- ALE
map('n', '<leader>p', '<Cmd>ALEFix<CR>', opts)

-- Diagnostic
map('n', '<leader>xx', '<Cmd>Trouble diagnostics toggle<CR>', opts)
map('n', '<leader>xX', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', opts)
map('n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
