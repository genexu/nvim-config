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
- FzfLua: `<leader>ff` (find files), `<leader>fg` (live grep), `<leader>fb` (buffers)
- Buffer navigation: `<C-,>` (previous), `<C-.>` (next), `<C-p>` (pick)
- LSP: `gd` (definition), `<leader>ih` (toggle inlay hints)
- Formatting: `<leader>p` (manual format with conform.nvim)

## Strudel Live Coding & LSP

Strudel support has two parts:
- `strudel.nvim` plugin — browser playback/eval, keymaps `<leader>s*` (see README)
- Custom `strudel` filetype mapped to the bundled `str-ls` language server (git submodule at `lsp/str-ls`)

`lua/configs/lsp.lua` maps `.str`, `.std`, `.strudel` extensions to the `strudel` filetype and starts `str-ls` via `vim.lsp.start` on FileType. The server is built to `lsp/str-ls/dist/server.js`; build with `pnpm install --dir lsp/str-ls && pnpm --dir lsp/str-ls build`. When touching Strudel-adjacent config, check both `lua/configs/lsp.lua` (filetype + LSP attach) and `lua/configs/nvim-treesitter.lua` (`strudel` filetype is registered to the `javascript` parser).

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

## Formatting & Linting

With nvim-lint + conform.nvim + mason-nvim-lint:
- **conform.nvim** - Code formatting (manual with `<leader>p`)
- **nvim-lint** - Auto-linting on save/edit with external tools
- **mason-nvim-lint** - Auto-install linters through Mason
- Configs: `lua/configs/conform.lua`, `lua/configs/nvim-lint.lua`, and `lua/configs/mason-nvim-lint.lua`

## Dependencies

Required external tools:
- ripgrep (for FzfLua live grep)
- fd (optional, for faster file finding)
- nerd-fonts (for icons)
- Language servers managed by Mason
- Formatters: prettier/prettierd, black, stylua, shfmt, etc.
- Linters: automatically installed via mason-nvim-lint (eslint_d, flake8, shellcheck, markdownlint, etc.)
- Node >= 18 and pnpm - required to build the bundled `str-ls` language server (`lsp/str-ls` git submodule)

## Current Plugin List

**Core:**
- plenary.nvim - Lua utility functions
- nvim-web-devicons - File type icons

**UI & Themes:**
- dashboard-nvim - Startup dashboard
- lualine.nvim - Status line
- nvim-tree.lua - File explorer
- barbar.nvim - Buffer tabs
- tokyonight.nvim - Tokyo Night color scheme
- which-key.nvim - Leader-key discovery popup

**Navigation:**
- fzf-lua - Fast and powerful file finder and grep

**LSP & Completion:**
- nvim-lspconfig - LSP configurations
- mason.nvim - LSP server manager
- mason-lspconfig.nvim - Mason integration
- fidget.nvim - LSP progress UI
- blink.cmp - Completion engine (Rust fuzzy matcher)
- LuaSnip - Snippet engine

**Git Integration:**
- vim-fugitive - Git commands
- gitsigns.nvim - Git signs in gutter

**Language & Syntax:**
- nvim-treesitter - Syntax highlighting
- nvim-autopairs - Auto-close brackets
- Comment.nvim - Commenting utility
- nvim-lint - Auto-linting with external tools
- mason-nvim-lint - Auto-install linters through Mason
- conform.nvim - Code formatting
- strudel.nvim - Strudel live coding (browser playback/eval, `<leader>s*` keymaps)

**Utilities:**
- neoscroll.nvim - Smooth scrolling
- nvim-notify - Notification system
- todo-comments.nvim - TODO highlighting
- trouble.nvim - Diagnostics panel
- nvim-ufo - Folding enhancement
- promise-async - Async utilities
- statuscol.nvim - Status column
- grug-far.nvim - Search and replace
- vim-startuptime - Startup time profiling
