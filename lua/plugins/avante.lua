local status_ok, avante = pcall(require, "avante")

if not status_ok then
  return
end

avante.setup({
  provider = "openai",
  openai = {
    endpoint = "YOUR_AI_ENDPOINT",
    model = "gpt-4o",
    timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
    temperature = 0,
    max_completion_tokens = 4096, -- Increase this to include reasoning tokens (for reasoning models)
    reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  },
  -- system_prompt as function ensures LLM always has latest MCP server state
  -- This is evaluated for every message, even in existing chats
  system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
  end,
  -- Using function prevents requiring mcphub before it's loaded
  custom_tools = function()
      return {
          require("mcphub.extensions.avante").mcp_tool(),
      }
  end,
})
