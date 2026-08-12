# NVim Config

![preview](./assets/preview.png)

## Requirements
- [Neovim](https://neovim.io/) (v0.11+)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Required for FzfLua live grep
- [fd](https://github.com/sharkdp/fd) - (Optional) Faster alternative to `find` for FzfLua
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) - Required for icons in NvimTree

## Plugin Manager
This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. Lazy.nvim will be automatically installed on first startup.

## Installation
1. Clone this repository. 
2. Link the `init.lua` and `lua` directory to the Neovim configuration directory, usually `~/.config/nvim`.
```sh
ln -s $PWD/init.lua ~/.config/nvim/init.lua
ln -s $PWD/lua ~/.config/nvim/lua
```
3. Start Neovim - lazy.nvim will automatically bootstrap and install all plugins.
4. Optionally run `:Lazy` to open the plugin manager interface.


## Keybindings

| Keybinding       | Description                              |
|------------------|------------------------------------------|
| `[n] <leader>`   | `\`                                      |
| `[n] <leader>ff` | FzfLua find files                        |
| `[n] <leader>fg` | FzfLua live grep                         |
| `[n] <leader>fb` | FzfLua buffers                           |
| `[v] <C-f>`      | FzfLua live grep selection               |
| `[n] <C-r>`      | FzfLua resume                            |
| `[n] <C-,>`      | Buffer previous                          |
| `[n] <C-.>`      | Buffer next                              |
| `[n] <C-p>`      | Buffer pick                              |
| `[n] <C-e>`      | NvimTree toggle                          |
| `[n] <leader>nf` | NvimTree find file                       |
| `[n] <leader>nc` | NvimTree collapse                        |
| `[n] <leader>p`  | Format with conform.nvim                 |
| `[n] <leader>e`  | Open diagnostics float                   |
| `[n] <leader>xx` | Trouble diagnostics toggle               |
| `[n] <leader>xX` | Trouble diagnostics toggle (current buf) |
| `[n] <leader>zR` | UFO Open all folds                       |
| `[n] <leader>zM` | UFO Close all folds                      |

## AI Integration

### GitHub Copilot
[copilot.vim](https://github.com/github/copilot.vim)

Run `:Copilot setup` to configure Copilot.

### Optional AI Plugins (Commented Out)
Additional AI plugins are available but currently commented out:
- **Avante**: AI coding assistant with Claude/OpenAI integration
- **MCPHub**: Model Context Protocol server integration

To enable: uncomment the plugin specs in `lua/plugins.lua` and configure as needed.

## LSP (Language Server Protocol)

This configuration uses [Mason](https://github.com/mason-org/mason.nvim) for automatic LSP server management. Configured language servers include:

- **TypeScript/JavaScript**: `ts_ls` (formerly tsserver)
- **Python**: `pyright`
- **Go**: `gopls`
- **Lua**: `lua_ls`
- **HTML**: `html`
- **CSS**: `cssls`

LSP servers are automatically installed and configured through Mason. For more server configurations, see the [nvim-lspconfig documentation](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

## Plugins

### Core
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Lua utility functions
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - File type icons

### UI & Themes
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) - Startup dashboard
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Status line
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - Tokyo Night color scheme
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - File explorer
- [barbar.nvim](https://github.com/romgrk/barbar.nvim) - Buffer tabs
- [dressing.nvim](https://github.com/stevearc/dressing.nvim) - UI improvements
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim) - UI components

### Navigation
- [fzf-lua](https://github.com/ibhagwan/fzf-lua) - Fast and powerful file finder and grep

### LSP & Completion
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configurations
- [mason.nvim](https://github.com/mason-org/mason.nvim) - LSP server manager
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) - Mason integration
- [fidget.nvim](https://github.com/j-hui/fidget.nvim) - LSP progress UI
- [blink.cmp](https://github.com/Saghen/blink.cmp) - Completion engine (Rust fuzzy matcher)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine

### Git Integration
- [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git commands
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git signs in gutter

### Language & Syntax
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto-close brackets
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Commenting utility
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - Auto-linting with external tools
- [mason-nvim-lint](https://github.com/rshkarin/mason-nvim-lint) - Auto-install linters through Mason
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Code formatting

### Utilities
- [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) - Smooth scrolling
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - Notification system
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - TODO highlighting
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Diagnostics panel
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Folding enhancement
- [promise-async](https://github.com/kevinhwang91/promise-async) - Async utilities
- [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim) - Status column
- [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) - Search and replace
- [vim-startuptime](https://github.com/dstein64/vim-startuptime) - Startup time profiling

### AI
- [github/copilot.vim](https://github.com/github/copilot.vim) - GitHub Copilot

## Configuration Structure

```
nvim-config/
├── init.lua              # Entry point, bootstraps lazy.nvim and loads modules
├── lua/
│   ├── globals.lua       # Global variables and aliases
│   ├── settings.lua      # Neovim settings and options
│   ├── keybindings.lua   # Custom keybindings
│   ├── plugins.lua       # Plugin definitions with lazy.nvim
│   └── configs/          # Individual plugin configurations
│       ├── blink.lua
│       ├── conform.lua
│       ├── dashboard-nvim.lua
│       ├── lazy.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── mason-nvim-lint.lua
│       ├── neoscroll.lua
│       ├── nvim-lint.lua
│       ├── nvim-tree.lua
│       ├── nvim-treesitter.lua
│       ├── statuscol.lua
│       └── ufo.lua
└── assets/
    └── preview.png
```

## Recommended Terminal

[WezTerm](https://wezfurlong.org/wezterm/index.html) with Tokyo Night Moon color scheme:

```lua
config.color_scheme = 'Tokyo Night Moon'
```

For more information, see the [WezTerm configuration documentation](https://wezfurlong.org/wezterm/config/files.html).
