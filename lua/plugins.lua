local Plug = vim.fn['plug#']

vim.call('plug#begin')

----- Core -----
Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')

----- UI & Themes -----
Plug('MunifTanjim/nui.nvim')
Plug('nvimdev/dashboard-nvim')
Plug 'nvim-lualine/lualine.nvim'
Plug('navarasu/onedark.nvim')
Plug('nvim-tree/nvim-tree.lua')
Plug('SmiteshP/nvim-navic')
Plug('utilyre/barbecue.nvim')
Plug('romgrk/barbar.nvim')

----- Navigation -----
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8', ['frozen'] = true })

----- LSP -----
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

----- Completions -----
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
Plug('hrsh7th/vim-vsnip-integ')

----- Git Integration -----
Plug('tpope/vim-fugitive')
Plug('lewis6991/gitsigns.nvim')
Plug('github/copilot.vim')

----- Languages & Syntax -----
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate' })
Plug('windwp/nvim-autopairs')
Plug('numToStr/Comment.nvim')
Plug('dense-analysis/ale')

----- Utilities -----
Plug('karb94/neoscroll.nvim')
Plug('rcarriga/nvim-notify')
Plug('folke/noice.nvim')
Plug('folke/todo-comments.nvim')

vim.call('plug#end')

require('plugins.ale')
require('plugins.barbecue')
require('plugins.comment')
require('plugins.dashboard-nvim')
require('plugins.gitsigns')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.neoscroll')
require('plugins.noice')
require('plugins.nvim-cmp')
require('plugins.nvim-autopairs')
require('plugins.nvim-notify')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.onedark')
require('plugins.telescope')
require('plugins.todo-comments')
