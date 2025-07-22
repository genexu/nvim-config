local status_ok, dashboard = pcall(require, "dashboard")

if not status_ok then
  return
end

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
