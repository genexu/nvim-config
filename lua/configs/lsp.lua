local function safe_require(module)
  local status_ok, mod = pcall(require, module)
  if not status_ok then
    return nil
  end
  return mod
end

local mason = safe_require("mason")
local mason_lspconfig = safe_require("mason-lspconfig")
local lsp = safe_require("lspconfig")
local cmp_nvim_lsp = safe_require("cmp_nvim_lsp")
local navic = safe_require("nvim-navic")

if mason and mason_lspconfig then
  mason.setup()
  mason_lspconfig.setup {
    ensure_installed = {
      "ts_ls",
      "html",
      "cssls",
      "gopls",
      "pyright",
      "lua_ls"
    },
    automatic_enable = false,
  }
end

if not lsp then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

if cmp_nvim_lsp then
  capabilities = cmp_nvim_lsp.default_capabilities()
end

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local on_attach = function(client, bufnr)
  if navic then
    navic.attach(client, bufnr)
  end
end

local servers = {
  gopls = {},
  pyright = {},
  ts_ls = {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.tsx" },
    root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  },
  html = {},
  cssls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        }
      }
    }
  }
}

-- Set up each LSP server with the common capabilities and on_attach
for server, config in pairs(servers) do
  config.capabilities = capabilities
  config.on_attach = on_attach
  lsp[server].setup(config)
end

-- Configure diagnostics display with deduplication
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  update_in_insert = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})
