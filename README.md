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
----------------------------------------------------
| Keybinding       | Description                   |
|------------------|-------------------------------|
| `[n] <leader>`   | `\`                           |
| `[n] <leader>ff` | Telescope find files          |
| `[n] <leader>fg` | Telescope live grep           |
| `[n] <leader>fb` | Telescope buffers             |
| `[n] <leader>fh` | Telescope help tags           |
| `[v] C-f`        | Telescope live grep selection |
| `[n] C-,`        | Buffer previous               |
| `[n] C-.`        | Buffer next                   |
| `[n] C-p`        | Buffer pick                   |
| `[n] C-e`        | NvimTree toggle               |
| `[n] <leader>nf` | NvimTree find file            |
| `[n] <leader>nc` | NvimTree collapse             |
| `[n] <leader>p`  | ALT fix                       |
----------------------------------------------------

## Github Copilot Support
[copilot.vim](https://github.com/github/copilot.vim)

Run `:Copilot setup` to configure Copilot.

## LSP (Language Server Protocol)
[nvim-lspconfig/blob/master/doc/server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

- [tsserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver)
- [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
- [gopls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls)
- [lua_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls)
- [html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)
- [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls)

## Plugins
Core
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

UI & Themes
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [onedark](https://github.com/navarasu/onedark.nvim)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
- [barbar.nvim](https://github.com/romgrk/barbar.nvim)

Navigation
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

LSP
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

Completion
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
- [vim-vsnip-integ](https://github.com/hrsh7th/vim-vsnip-integ)

Git Integration
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [copilot.vim](https://github.com/github/copilot.vim)

Language & Syntax
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [ale](https://github.com/dense-analysis/ale)

Utilities
- [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
