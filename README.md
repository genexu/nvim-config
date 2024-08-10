# NVim Config

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

## LSP (Language Server Protocol)
TBD

## Plugins
TBD

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
