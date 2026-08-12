local utils = require("utils")
local lint = utils.safe_require("lint")
if not lint then return end

-- Customize mypy to use venv
lint.linters.mypy = require('lint').linters.mypy
lint.linters.mypy.args = {
  function()
    local root_dir = vim.fn.getcwd()
    local python_path = utils.get_python_path(root_dir)
    return '--python-executable=' .. python_path
  end,
  '--show-column-numbers',
  '--show-error-end',
  '--hide-error-codes',
  '--hide-error-context',
  '--no-color-output',
  '--no-error-summary',
  '--no-pretty',
}

-- Configure linters by filetype
lint.linters_by_ft = {
  -- JavaScript/TypeScript
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },

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
