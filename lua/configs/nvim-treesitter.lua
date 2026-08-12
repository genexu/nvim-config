local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
  return
end

ts.install({
  "typescript", "javascript", "tsx", "go", "python",
  "html", "css", "json", "yaml", "lua", "vim", "vimdoc",
  "regex", "bash", "markdown", "markdown_inline",
})

-- Map filetypes that don't share their parser name
vim.treesitter.language.register("tsx", "typescriptreact")
vim.treesitter.language.register("bash", { "sh", "zsh" })
vim.treesitter.language.register("vimdoc", "help")

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "typescript", "typescriptreact", "javascript", "javascriptreact",
    "go", "python", "html", "css", "json", "yaml",
    "lua", "vim", "help", "bash", "sh", "zsh", "markdown",
  },
  callback = function() pcall(vim.treesitter.start) end,
})
