return {
  -- Core
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  ----- UI & Themes -----
  {
    "nvimdev/dashboard-nvim",
    event = 'VimEnter',
    config = function()
      require("configs.dashboard-nvim")
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("configs.nvim-tree")
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight-moon]]
    end,
  },
  {
    "stevearc/dressing.nvim",
  },
  {
    "MunifTanjim/nui.nvim"
  },

  ----- Navigation -----
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require("configs.telescope")
    end,
  },
  ----- LSP -----
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("configs.lsp")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  ----- Completions -----
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
    },
    config = function()
      require("configs.nvim-cmp")
    end,
  },
  ----- Git Integration -----
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  ----- Languages & Syntax -----
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("configs.nvim-treesitter")
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("configs.nvim-lint")
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("configs.conform")
    end,
  },
  ----- Utilities -----
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("configs.neoscroll")
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      "kevinhwang91/promise-async"
    },
    config = function()
      require("configs.ufo")
    end
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require("configs.statuscol")
    end,
  },
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  ----- AI -----
  {
    "github/copilot.vim"
  }
  -- Plug('yetone/avante.nvim', { ['branch'] = 'main', ['do'] = 'make' })
  -- Plug('ravitemer/mcphub.nvim', { ['do'] = 'npm install -g mcp-hub@latest' })
}
