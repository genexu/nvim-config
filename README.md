# NVim Config
This is my personal Neovim configuration. It is a work in progress and will be updated as I learn more about Neovim and Vimscript.

## Requirements
- [Neovim](https://neovim.io/)
- [vim-plug](https://github.com/junegunn/vim-plug)

## Plugin Manager
This configuration uses vim-plug as the plugin manager. The plugins are defined in the `init.lua` file.

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Installation
1. Clone this repository to your Neovim configuration directory. For most users, this will be `~/.config/nvim`.
2. Run `:PlugInstall` to install the plugins.
3. Restart Neovim.

## Github Copilot
Setup [GitHub Copilot](https://github.com/github/copilot.vim) for Neovim.
Run `:Copilot setup` to configure Copilot.

## Plugins
TBD

## Keybindings
- `[n] <leader>` is set to `\`
- `[n] <leader>ff` - Telescope find files
- `[n] <leader>fg` - Telescope live grep
- `[n] <leader>fb` - Telescope buffers
- `[n] <leader>fh` - Telescope help tags
- `[n] C-,` - Buffer previous
- `[n] C-.` - Buffer next
- `[n] C-w` - Save and close buffer
- `[n] C-p` - Buffer pick
- `[n] C-e` - NvimTree toggle
- `[v] C-f` - Telescope live grep selection


