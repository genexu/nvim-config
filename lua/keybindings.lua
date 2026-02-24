local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- FzfLua
map('n', '<leader>ff', '<Cmd>FzfLua files<CR>', opts)
map('n', '<leader>fg', '<Cmd>FzfLua live_grep<CR>', opts)
map('n', '<leader>fb', '<Cmd>FzfLua buffers<CR>', opts)
map('v', '<C-f>', function()
  local text = vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.'), { type = vim.fn.mode() })
  require('fzf-lua').live_grep({ search = table.concat(text, '\n') })
end, opts)
map('n', '<C-r>', '<Cmd>FzfLua resume<CR>', opts)

-- Buffer navigation
map('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- NvimTree
map('n', '<C-e>', 'y<ESC>:NvimTreeToggle<CR>', opts)
map('n', '<leader>nf', '<Cmd>NvimTreeFindFile<CR>', opts)
map('n', '<leader>nc', '<Cmd>NvimTreeCollapse<CR>', opts)

-- Barbar
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-C>', '<Cmd>BufferCloseAllButCurrent<CR>', opts)

-- Formatting
map('n', '<leader>p', function()
  require('conform').format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 3000,
  })
end, { desc = "Format file or range" })

-- LSP
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

-- Diagnostic
map('n', '<leader>xx', '<Cmd>Trouble diagnostics toggle<CR>', opts)
map('n', '<leader>xX', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', opts)
map('n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
