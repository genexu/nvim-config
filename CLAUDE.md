# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Structure

This is a Neovim configuration using vim-plug as the plugin manager with a modular Lua structure:

- `init.lua` - Entry point that sets leader key and loads modules
- `lua/plugins.lua` - Main plugin definitions and vim-plug configuration
- `lua/settings.lua` - General Neovim settings and options
- `lua/keybindings.lua` - Custom keybindings and mappings
- `lua/globals.lua` - Global variables and aliases
- `lua/plugins/` - Individual plugin configurations

## Installation Commands

After making changes to plugin configurations:
```bash
# Install new plugins
nvim +PlugInstall +qall

# Update existing plugins
nvim +PlugUpdate +qall

# Clean unused plugins
nvim +PlugClean +qall
```

## Key Keybindings

- Leader key: `\`
- Telescope: `<leader>ff` (find files), `<leader>fg` (live grep), `<leader>fb` (buffers)
- Buffer navigation: `<C-,>` (previous), `<C-.>` (next), `<C-p>` (pick)
- File tree: `<C-e>` (toggle), `<leader>nf` (find file)
- Diagnostics: `<leader>xx` (Trouble toggle), `<leader>e` (open float)
- ALE: `<leader>p` (fix)

## Common Development Patterns

When adding new plugins:
1. Add to appropriate category in `lua/plugins.lua`
2. Create individual config file in `lua/plugins/` if needed
3. Require the config file at the bottom of `lua/plugins.lua`
4. Use `pcall(require, "plugin_name")` for safe loading

When modifying keybindings:
- Use `vim.keymap.set` with proper options
- Follow existing patterns for leader key combinations
- Update README.md keybindings table if adding new mappings

## AI Plugin Configuration

AI plugins (Avante, MCPHub) are currently commented out in the configuration:
- To enable: uncomment the plugin lines in `lua/plugins.lua` and their require statements
- Avante config in `lua/plugins/avante.lua` uses placeholder values that need customization
- Update endpoint and model name in avante.lua before enabling

## Dependencies

Required external tools:
- ripgrep (for Telescope live grep)
- fd (optional, for faster file finding)
- nerd-fonts (for icons)
- Language servers managed by Mason