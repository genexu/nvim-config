local nvim_tree = require("utils").safe_require("nvim-tree")
if not nvim_tree then return end

nvim_tree.setup({
  filters = {
    git_ignored = false,
  }
})
