# NVim Config

![preview](./assets/preview.png)

## Requirements
- [Neovim](https://neovim.io/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Required for Telescope live grep
- [fd](https://github.com/sharkdp/fd) - (Optional) Faster alternative to `find` for Telescope
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) - Required for icons in NvimTree

## Plugin Manager
This configuration uses vim-plug as the plugin manager. To install vim-plug, run the following command:
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Installation
1. Clone this repository. 
2. Link the `init.lua` and `lua` directory to the Neovim configuration directory, usually `~/.config/nvim`.
```sh
ln -s $PWD/init.lua ~/.config/nvim/init.lua
ln -s $PWD/lua ~/.config/nvim/lua
```
3. Run `:PlugInstall` to install the plugins.
4. Restart Neovim.


## Keybindings

| Keybinding       | Description                              |
|------------------|------------------------------------------|
| `[n] <leader>`   | `\`                                      |
| `[n] <leader>ff` | Telescope find files                     |
| `[n] <leader>fg` | Telescope live grep                      |
| `[n] <leader>fb` | Telescope buffers                        |
| `[n] <leader>fh` | Telescope help tags                      |
| `[v] <C-f>`      | Telescope live grep selection            |
| `[n] <C-r>`      | Telescope resume                         |
| `[n] <C-,>`      | Buffer previous                          |
| `[n] <C-.>`      | Buffer next                              |
| `[n] <C-p>`      | Buffer pick                              |
| `[n] <C-e>`      | NvimTree toggle                          |
| `[n] <leader>nf` | NvimTree find file                       |
| `[n] <leader>nc` | NvimTree collapse                        |
| `[n] <leader>p`  | ALE fix                                  |
| `[n] <leader>e`  | Open diagnostics float                   |
| `[n] <leader>xx` | Trouble diagnostics toggle               |
| `[n] <leader>xX` | Trouble diagnostics toggle (current buf) |
| `[n] <leader>zR` | UFO Open all folds                       |
| `[n] <leader>zM` | UFO Close all folds                      |

## AI Integration

### GitHub Copilot
[copilot.vim](https://github.com/github/copilot.vim)

Run `:Copilot setup` to configure Copilot.

### Avante & MCPHub (Optional)
AI plugins are currently commented out in the configuration:
- **Avante**: AI coding assistant with Claude/OpenAI integration
- **MCPHub**: Model Context Protocol server integration for enhanced AI capabilities

To enable these plugins:
1. Uncomment the plugin lines in `lua/plugins.lua`
2. Uncomment the require statements at the bottom of `lua/plugins.lua`
3. Configure the endpoint and model in `lua/plugins/avante.lua`
4. Run `:PlugInstall` to install

## LSP (Language Server Protocol)

This configuration uses [Mason](https://github.com/williamboman/mason.nvim) for automatic LSP server management. Configured language servers include:

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
- [nvim-navic](https://github.com/SmiteshP/nvim-navic) - Breadcrumb navigation
- [barbecue.nvim](https://github.com/utilyre/barbecue.nvim) - Winbar breadcrumbs
- [barbar.nvim](https://github.com/romgrk/barbar.nvim) - Buffer tabs
- [dressing.nvim](https://github.com/stevearc/dressing.nvim) - UI improvements
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim) - UI components

### Navigation
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
- [fzf.vim](https://github.com/junegunn/fzf.vim) - Vim integration for fzf
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - Native fzf for Telescope
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder and picker

### LSP & Completion
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP server manager
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Mason integration
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configurations
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - LSP completion source
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Buffer completion
- [cmp-path](https://github.com/hrsh7th/cmp-path) - Path completion
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - Command line completion
- [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip) - Snippet completion
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip) - Snippet engine
- [vim-vsnip-integ](https://github.com/hrsh7th/vim-vsnip-integ) - Snippet integration

### Git Integration
- [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git commands
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git signs in gutter

### Language & Syntax
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto-close brackets
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Commenting utility
- [ale](https://github.com/dense-analysis/ale) - Linting and fixing

### Utilities
- [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) - Smooth scrolling
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - Notification system
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - TODO highlighting
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Diagnostics panel
- [promise-async](https://github.com/kevinhwang91/promise-async) - Async utilities
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Folding enhancement
- [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim) - Status column
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) - Markdown rendering

### AI (Optional)
- [github/copilot.vim](https://github.com/github/copilot.vim) - GitHub Copilot
- [yetone/avante.nvim](https://github.com/yetone/avante.nvim) - AI coding assistant *(commented out)*
- [ravitemer/mcphub.nvim](https://github.com/ravitemer/mcphub.nvim) - MCP integration *(commented out)*

## Configuration Structure

```
nvim-config/
├── init.lua              # Entry point, loads all modules
├── lua/
│   ├── globals.lua       # Global variables and aliases
│   ├── settings.lua      # Neovim settings and options
│   ├── keybindings.lua   # Custom keybindings
│   ├── plugins.lua       # Plugin definitions with vim-plug
│   └── plugins/          # Individual plugin configurations
│       ├── ale.lua
│       ├── avante.lua
│       ├── dashboard-nvim.lua
│       ├── lsp.lua
│       ├── mcphub.lua
│       ├── neoscroll.lua
│       ├── nvim-cmp.lua
│       ├── nvim-tree.lua
│       ├── nvim-treesitter.lua
│       ├── statuscol.lua
│       ├── telescope.lua
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
