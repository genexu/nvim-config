local status_ok, mason_nvim_lint = pcall(require, "mason-nvim-lint")

if not status_ok then
  return
end

mason_nvim_lint.setup({
  -- Ensure these linters are installed automatically
  ensure_installed = {
    -- JavaScript/TypeScript
    "eslint_d", -- or "eslint"

    -- Python
    "flake8",
    "mypy",

    -- Go
    "golangcilint",

    -- Shell
    "shellcheck",

    -- Markdown
    "markdownlint",

    -- YAML
    "yamllint",

    -- JSON
    "jsonlint",
  },

  -- Auto-install missing linters
  automatic_installation = true,

  -- Quiet mode (don't show installation messages)
  quiet_mode = false,
})

