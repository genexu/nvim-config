local ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not ok then
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
    "vim",
    "regex",
    "bash",
    "markdown",
    "markdown_inline",
  },
  highlight = {
    enable = true,
  }
}
