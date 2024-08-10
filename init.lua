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
--- Backup and swap files
------------------------------------------
-- Disable backup and swap files for better performance
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

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
Plug('github/copilot.vim')
Plug('windwp/nvim-autopairs')
Plug('numToStr/Comment.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8', ['frozen'] = true })
Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install' })

Plug('karb94/neoscroll.nvim')

Plug('tpope/vim-fugitive')
Plug('lewis6991/gitsigns.nvim')

Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

Plug('SmiteshP/nvim-navic')
Plug('utilyre/barbecue.nvim')

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

Plug('rcarriga/nvim-notify')

Plug('folke/todo-comments.nvim')

-- https://github.com/MunifTanjim/prettier.nvim

vim.call('plug#end')

vim.notify = require("notify")

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
require('gitsigns').setup()
require('barbecue').setup()
require('todo-comments').setup()

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "gopls",
    "pyright",
    "lua_ls"
  },
}

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
  navic.attach(client, bufnr)
end

--
local lsp = require('lspconfig')
lsp.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lsp.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lsp.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.tsx" },
  root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  capabilities = capabilities,
  on_attach = on_attach,
}
lsp.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lsp.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lsp.lua_ls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}


require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "tsx",
    "go",
    "python",
    "html",
    "css",
    "json",
    "yaml",
    "lua",
  },
  highlight = {
    enable = true,
  }
}


require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    }
  }
}

require('dashboard').setup {
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    packages = { enable = false },
    project = { enable = false }
  }
}

require('neoscroll').setup({
  mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
    '<C-u>', '<C-d>',
  },
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing = 'linear',           -- Default easing function
  pre_hook = nil,              -- Function to run before the scrolling animation starts
  post_hook = nil,             -- Function to run after the scrolling animation ends
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

require('onedark').load()
