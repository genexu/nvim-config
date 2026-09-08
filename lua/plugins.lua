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
      require("configs.lualine")
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
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 400,
      spec = {
        { "<leader>f",  group = "find" },
        { "<leader>n",  group = "nvim-tree" },
        { "<leader>g",  group = "git" },
        { "<leader>x",  group = "diagnostics" },
        { "<leader>p",  desc = "Format buffer" },
        { "<leader>e",  desc = "Diagnostic float" },
        { "<leader>rn", desc = "LSP rename" },
        { "<leader>ca", desc = "LSP code action" },
        { "<leader>ih", desc = "Toggle inlay hints" },
      },
    },
  },

  ----- Navigation -----
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  ----- LSP -----
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("configs.lsp")
    end,
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  ----- Completions -----
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = { "saghen/blink.lib", "L3MON4D3/LuaSnip" },
    build = function() require("blink.cmp").build():pwait() end,
    config = function()
      require("configs.blink")
    end,
  },
  {
    "github/copilot.vim",
  },
  ----- Git Integration -----
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  },
  ----- Languages & Syntax -----
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
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
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
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
    "rshkarin/mason-nvim-lint",
    dependencies = {
      "mason-org/mason.nvim",
      "mfussenegger/nvim-lint",
    },
    config = function()
      require("configs.mason-nvim-lint")
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
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
      });
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
}
