local dashboard = require("utils").safe_require("dashboard")
if not dashboard then return end

dashboard.setup {
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    packages = { enable = false },
    project = { enable = false }
  }
}
