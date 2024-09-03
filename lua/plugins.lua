local Plug = vim.fn['plug#']

vim.call('plug#begin')

----- Core -----
Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')

----- UI & Themes -----
Plug('nvimdev/dashboard-nvim')
Plug 'nvim-lualine/lualine.nvim'
Plug('nvim-tree/nvim-tree.lua')
Plug('SmiteshP/nvim-navic')
Plug('utilyre/barbecue.nvim')
Plug('romgrk/barbar.nvim')
Plug('folke/tokyonight.nvim')

----- Navigation -----
Plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
Plug('junegunn/fzf.vim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
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
Plug('folke/todo-comments.nvim')
Plug('folke/trouble.nvim')
Plug('kevinhwang91/promise-async')
Plug('kevinhwang91/nvim-ufo')
Plug('luukvbaal/statuscol.nvim')
-- Plug('dstein64/vim-startuptime')

vim.call('plug#end')

vim.cmd[[colorscheme tokyonight-moon]]

require('barbecue').setup()
require('Comment').setup()
require('gitsigns').setup()
require('lualine').setup()
require('nvim-autopairs').setup()
require('notify').setup()
require('todo-comments').setup()
require('trouble').setup()

require('plugins.ale')
require('plugins.dashboard-nvim')
require('plugins.lsp')
require('plugins.neoscroll')
require('plugins.nvim-cmp')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.statuscol')
require('plugins.telescope')
require('plugins.ufo')
