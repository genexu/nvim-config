local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
  },
}

-- TODO: Setup fzf extension
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim

--[[
extensions = {
  fzf = {
    fuzzy = true,                    -- false will only do exact matching
    override_generic_sorter = false, -- override the generic sorter
    override_file_sorter = true,     -- override the file sorter
    case_mode = "smart_case",        -- or "ignore_case" or "respect_case", default is "smart_case"
  }
}

telescope.load_extension('fzf')
]]
