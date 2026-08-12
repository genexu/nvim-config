local ts = require("utils").safe_require("nvim-treesitter")
if not ts then
  return
end

local parsers = {
  "typescript", "javascript", "tsx", "go", "python",
  "html", "css", "json", "yaml", "lua", "vim", "vimdoc",
  "regex", "bash", "markdown", "markdown_inline",
}

-- Install only missing parsers, and only when the tree-sitter CLI is on PATH.
-- ponytail: silent-skip. Run :checkhealth nvim-treesitter to see what's wrong.
if vim.fn.executable("tree-sitter") == 1 then
  local installed = {}
  for _, path in ipairs(vim.api.nvim_get_runtime_file("parser/*.so", true)) do
    installed[vim.fn.fnamemodify(path, ":t:r")] = true
  end
  local missing = {}
  for _, name in ipairs(parsers) do
    if not installed[name] then
      table.insert(missing, name)
    end
  end
  if #missing > 0 then
    ts.install(missing)
  end
end

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
