local vim = vim
local Plug = vim.fn['plug#']

------------------------------------------
-- General configuration
------------------------------------------
vim.o.encoding = "utf-8"
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.wildmenu = true
vim.o.wildmode = "longest:list,full"
vim.o.wildignore = "*.o,*.obj,*~,*.pyc,__pycache__,*.swp,*.bak,*.pyc,*.class,*.DS_Store,*.git,*.hg,*.svn"
vim.o.wrap = true
vim.o.breakindent = true
vim.o.title = true

------------------------------------------
-- Text, tab and indent related
------------------------------------------
vim.o.expandtab = true
vim.o.smarttab = true

-- 1 tab == 2 spaces
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2

vim.o.autoindent = true
vim.o.smartindent = true

------------------------------------------
-- Searching case configuration
------------------------------------------
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

------------------------------------------
--- Ruler, line number and cursor line
------------------------------------------
vim.o.ruler = true
vim.o.number = true
vim.o.cursorline = true

-- Disable showcmd and showmode in status line (use lualine instead)
vim.o.showcmd = false
vim.o.showmode = false

------------------------------------------
--- Filetype detection
------------------------------------------
vim.cmd('filetype plugin indent on')


------------------------------------------
--- Plugins
------------------------------------------
vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug 'nvim-lualine/lualine.nvim'
Plug('romgrk/barbar.nvim')
Plug('navarasu/onedark.nvim')
Plug('nvimdev/dashboard-nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate' })
Plug 'tpope/vim-fugitive'
Plug('github/copilot.vim')
Plug('folke/which-key.nvim')
Plug('windwp/nvim-autopairs')
Plug('numToStr/Comment.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install' })

vim.call('plug#end')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)
-- Close buffer
map('n', '<C-w>', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Select Search
map('v', '<C-f>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', opts)
-- NvimTreeToggle
map('n', '<C-e>', 'y<ESC>:NvimTreeToggle<CR>', opts)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("nvim-tree").setup()
require('lualine').setup()
require("nvim-autopairs").setup()
require('Comment').setup()
require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "node_modules" 
    }
  }
}
require('dashboard').setup({
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    packages = { enable = false },
    project = { enable = false }
  }
})

require('onedark').load()
