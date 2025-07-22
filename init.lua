require('configs.lazy')
require('globals')
require('settings')

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

require('keybindings')
