local blink = require("utils").safe_require("blink.cmp")
if not blink then return end

blink.setup({
  -- preserve muscle memory from old nvim-cmp setup:
  --   <C-j>/<C-k> navigate, <CR> confirm, <C-c> hide, <C-Space> manual show/docs
  keymap = {
    preset = "none",
    ["<CR>"] = { "accept", "fallback" },
    ["<C-c>"] = { "hide", "fallback" },
    ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },
  snippets = { preset = "luasnip" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  cmdline = {
    keymap = { preset = "cmdline" },
    completion = { menu = { auto_show = true } },
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
  fuzzy = { implementation = "rust" },
  appearance = { nerd_font_variant = "mono" },
})

