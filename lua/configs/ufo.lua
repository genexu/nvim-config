local ufo = require("utils").safe_require("ufo")
if not ufo then return end

ufo.setup()

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', 'zR', ufo.openAllFolds, opts)
map('n', 'zM', ufo.closeAllFolds, opts)
