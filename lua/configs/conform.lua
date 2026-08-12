local status_ok, conform = pcall(require, "conform")

if not status_ok then
  return
end

conform.setup({
  formatters_by_ft = {
    -- JavaScript/TypeScript
    javascript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },

    -- Python
    python = { "black", "isort" },

    -- Go
    go = { "gofmt", "goimports" },

    -- Lua
    lua = { "stylua" },

    -- Shell
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
  },

  -- Notify on format errors
  notify_on_error = true,

  -- Auto-format on write (same fallback chain as manual <leader>p)
  format_on_save = {
    lsp_format = "fallback",
    timeout_ms = 3000,
  },

  -- Formatters configuration
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2", "-ci" },
    },
  },
})
