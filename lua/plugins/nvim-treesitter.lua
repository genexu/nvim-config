local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter")

if not treesitter_status_ok then
  return
end

local treesitter_config_status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")

if not treesitter_config_status_ok then
  return
end

treesitter_config.setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "tsx",
    "go",
    "python",
    "html",
    "css",
    "json",
    "yaml",
    "lua",
  },
  highlight = {
    enable = true,
  }
}

treesitter.setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "tsx",
    "go",
    "python",
    "html",
    "css",
    "json",
    "yaml",
    "lua",
  },
  highlight = {
    enable = true,
  }
}
