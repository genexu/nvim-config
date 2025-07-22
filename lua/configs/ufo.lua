local status_ok, ufo = pcall(require, 'ufo')

if not status_ok then
  return
end

ufo.setup()

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', 'zR', ufo.openAllFolds, opts)
map('n', 'zM', ufo.closeAllFolds, opts)
