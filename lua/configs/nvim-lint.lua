local status_ok, lint = pcall(require, "lint")

if not status_ok then
  return
end

-- Configure linters by filetype
lint.linters_by_ft = {
  -- JavaScript/TypeScript
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },

  -- Python
  python = { "flake8", "mypy" },

  -- Go
  go = { "golangcilint" },

  -- Shell
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  zsh = { "shellcheck" },

  -- Markdown
  markdown = { "markdownlint" },

  -- YAML
  yaml = { "yamllint" },

  -- JSON
  json = { "jsonlint" },
}

-- Auto-lint on events
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
