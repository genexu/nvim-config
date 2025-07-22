# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Structure

This is a Neovim configuration using lazy.nvim as the plugin manager with a modular Lua structure:

- `init.lua` - Entry point that sets leader key, bootstraps lazy.nvim, and loads modules
- `lua/configs/lazy.lua` - Lazy.nvim bootstrap configuration
- `lua/plugins.lua` - Main plugin definitions and lazy.nvim specifications
- `lua/settings.lua` - General Neovim settings and options
- `lua/keybindings.lua` - Custom keybindings and mappings
- `lua/globals.lua` - Global variables and aliases
- `lua/configs/` - Individual plugin configurations

## Installation Commands

After making changes to plugin configurations:
```bash
# Install new plugins
nvim --headless "+Lazy! sync" +qa

# Update existing plugins  
nvim --headless "+Lazy! update" +qa

# Clean unused plugins
nvim --headless "+Lazy! clean" +qa

# Check plugin status
nvim --headless "+Lazy! check" +qa
```

Or interactively within Neovim:
- `:Lazy` - Open lazy.nvim UI
- `:Lazy sync` - Install missing and update plugins
- `:Lazy update` - Update plugins
- `:Lazy clean` - Remove unused plugins

## Key Keybindings

- Leader key: `\`
- Telescope: `<leader>ff` (find files), `<leader>fg` (live grep), `<leader>fb` (buffers)
- Buffer navigation: `<C-,>` (previous), `<C-.>` (next), `<C-p>` (pick)
- File tree: `<C-e>` (toggle), `<leader>nf` (find file)
- Diagnostics: `<leader>xx` (Trouble toggle), `<leader>e` (open float)
- Formatting: `<leader>p` (manual format with conform.nvim)

## Common Development Patterns

When adding new plugins:
1. Add plugin spec to appropriate category in `lua/plugins.lua`
2. Create individual config file in `lua/configs/` if needed
3. Use `config = function() require("configs.plugin_name") end` in plugin spec
4. Utilize lazy.nvim features like `event`, `cmd`, `ft`, `keys` for lazy loading
5. Use `dependencies` to specify plugin dependencies

When modifying keybindings:
- Use `vim.keymap.set` with proper options
- Follow existing patterns for leader key combinations
- Update README.md keybindings table if adding new mappings

## AI Plugin Configuration

AI plugins (Avante, MCPHub) are currently commented out in the configuration:
- To enable: uncomment the plugin specs in `lua/plugins.lua`
- Create corresponding config files in `lua/configs/` if needed
- Avante requires placeholder values to be customized for endpoints and models

## Formatting & Linting

With nvim-lint + conform.nvim:
- **conform.nvim** - Code formatting (manual with `<leader>p`)
- **nvim-lint** - Auto-linting on save/edit with external tools
- Configs: `lua/configs/conform.lua` and `lua/configs/nvim-lint.lua`

## Dependencies

Required external tools:
- ripgrep (for Telescope live grep)
- fd (optional, for faster file finding)
- nerd-fonts (for icons)
- Language servers managed by Mason
- Formatters: prettier/prettierd, black, stylua, shfmt, etc.
- Linters: eslint, flake8, shellcheck, markdownlint, etc.
