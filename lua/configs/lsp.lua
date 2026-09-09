local utils = require("utils")
local mason = utils.safe_require("mason")
local mason_lspconfig = utils.safe_require("mason-lspconfig")
local blink = utils.safe_require("blink.cmp")
local capabilities = vim.lsp.protocol.make_client_capabilities()

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

if blink then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

local on_attach = function(client, bufnr)
end

local servers = {
  gopls = {},
  pyright = {
    before_init = function(_, config)
      config.settings.python.pythonPath = utils.get_python_path(config.root_dir)
    end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = 'workspace',
        },
      },
    },
  },
  ts_ls = {},
  html = {},
  cssls = {},
  lua_ls = {}
}

-- Set up each LSP server with the common capabilities and on_attach
for server, config in pairs(servers) do
  config.capabilities = capabilities
  config.on_attach = on_attach

  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

-- Set up a custom LSP for Strudel files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "strudel" },
  callback = function()
    vim.lsp.start({
      name = "str-lsp",
      cmd = { "node", "./str-ls/dist/server.js", "--stdio" },
      root_dir = vim.fn.getcwd(),
    })
  end,
})

vim.filetype.add({
  extension = {
    strudel = "strudel",
    str = "strudel",
    std = "strudel",
  },
})

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
