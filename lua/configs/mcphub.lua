local status_ok, mcphub = pcall(require, "mcphub")

if not status_ok then
  return
end

mcphub.setup({
  extensions = {
    avante = {
      make_slash_commands = true, -- make /slash commands from MCP server prompts
    }
  }
})
