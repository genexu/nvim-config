# NVim Config

![preview](./assets/preview.png)

## Requirements

### System
- [Neovim](https://neovim.io/) (v0.11+; v0.12 supported)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - FzfLua live grep
- [fd](https://github.com/sharkdp/fd) - (Optional) faster file finding for FzfLua
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) - icons
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter) - compiles parsers for `nvim-treesitter` main branch: `brew install tree-sitter-cli`
- Rust toolchain (`rustup` / `cargo`) - required to build [blink.cmp](https://github.com/Saghen/blink.cmp)'s Rust fuzzy matcher on first install
- `git`, `make`, C compiler - required by Mason and various plugin builds

### Language Servers, Formatters, Linters
Auto-installed via Mason on first launch. Manually managed via `:Mason`.
- LSPs: `ts_ls`, `pyright`, `gopls`, `lua_ls`, `html`, `cssls`
- Formatters (via conform): prettier/prettierd, black, isort, stylua, gofmt, goimports, shfmt
- Linters (via nvim-lint): eslint_d, flake8, mypy, golangcilint, shellcheck, markdownlint, yamllint, jsonlint

## Plugin Manager
This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. Lazy.nvim will be automatically installed on first startup.

## Installation
1. Clone this repository with submodules (or run `git submodule update --init` after a plain clone):
```sh
git clone --recurse-submodules <repo-url>
```
2. Build the bundled Strudel language server (requires Node >= 18 and pnpm):
```sh
pnpm install --dir lsp/str-ls && pnpm --dir lsp/str-ls build
```
3. Link the `init.lua` and `lua` directory to the Neovim configuration directory, usually `~/.config/nvim`.
```sh
ln -s $PWD/init.lua ~/.config/nvim/init.lua
ln -s $PWD/lua ~/.config/nvim/lua
```
4. Start Neovim - lazy.nvim will automatically bootstrap and install all plugins.
5. Optionally run `:Lazy` to open the plugin manager interface.


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
| `[n] <leader>ih` | Toggle LSP inlay hints                   |
| `[n] <leader>xx` | Trouble diagnostics toggle               |
| `[n] <leader>xX` | Trouble diagnostics toggle (current buf) |
| `[n] <leader>zR` | UFO Open all folds                       |
| `[n] <leader>zM` | UFO Close all folds                      |
| `[n] <leader>sl` | Launch Strudel                            |
| `[n] <leader>sq` | Quit Strudel                              |
| `[n] <leader>st` | Toggle Strudel playback                   |
| `[n] <leader>su` | Evaluate Strudel buffer                   |
| `[n] <leader>ss` | Stop Strudel playback                     |
| `[n] <leader>sb` | Sync current buffer with Strudel          |
| `[n] <leader>sx` | Sync and evaluate Strudel buffer          |

## LSP (Language Server Protocol)

This configuration uses [Mason](https://github.com/mason-org/mason.nvim) for automatic LSP server management. Configured language servers include:

- **TypeScript/JavaScript**: `ts_ls` (formerly tsserver)
- **Python**: `pyright`
- **Go**: `gopls`
- **Lua**: `lua_ls`
- **HTML**: `html`
- **Strudel**: `str-ls` - bundled as the `lsp/str-ls` git submodule, attaches to the custom `strudel` filetype

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
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Leader-key discovery popup

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

### Strudel live coding
[strudel.nvim](https://github.com/gruvw/strudel.nvim) is bundled and configured for a side-by-side live-coding workflow: Neovim is the only code editor, while a visible Strudel browser window provides playback controls, error display, and visuals. It requires Node.js >= 16, npm, and a Chromium-based browser (this machine has Node `v24.18.1`, npm `11.16.0`, and Google Chrome installed).

Opening a `.str`, `.std`, or `.strudel` file assigns the custom `strudel` filetype. The bundled [str-ls](https://github.com/marcoskichel/str-ls) language server (git submodule at `lsp/str-ls`, built to `lsp/str-ls/dist/server.js`) attaches automatically and provides Strudel API hover documentation and mini-notation completion. Tree-sitter highlighting uses the existing `javascript` parser via `vim.treesitter.language.register`.

Workflow:
1. Write or open a `.str` buffer and save it.
2. Run `\\sl` to launch Strudel in a visible browser window and begin playback.
3. While playing, use `\\su` or save the buffer to evaluate edits.
4. Use `\\sx` after switching to another buffer to sync and evaluate it.
5. Use `\\st`, `\\ss`, and `\\sq` for toggle, stop, and quit.

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
