require('globals')

------------------------------------------
-- Vim built-in plugins configuration
------------------------------------------
--- Disable some built-in plugins we don't need
local disabled_built_ins = {
  'tutor',
  'man',
  'netrw',
  'netrwPlugin',
}
for _, plugin in pairs(disabled_built_ins) do
  g['loaded_' .. plugin] = 1
end

------------------------------------------
-- General configuration
------------------------------------------
opt.encoding = "utf-8"
opt.termguicolors = true
opt.background = "dark"
opt.wildmenu = true
opt.wildmode = "longest:list,full"
opt.wildignore = "*.o,*.obj,*~,*.pyc,__pycache__,*.swp,*.bak,*.pyc,*.class,*.DS_Store,*.git,*.hg,*.svn"
opt.wrap = true
opt.breakindent = true
opt.title = true

------------------------------------------
-- Text, tab and indent related
------------------------------------------
opt.expandtab = true
opt.smarttab = true

-- 1 tab == 2 spaces
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

opt.autoindent = true
opt.smartindent = true

------------------------------------------
--- Folding
------------------------------------------
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = '1'
opt.fillchars = [[eob: ,fold: ,foldopen:-,foldsep: ,foldclose:+]]

------------------------------------------
-- Searching case configuration
------------------------------------------
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

------------------------------------------
--- Ruler, line number and cursor line
------------------------------------------
opt.ruler = true
opt.number = true
opt.cursorline = true

-- Disable showcmd and showmode in status line (use lualine instead)
opt.showcmd = false
opt.showmode = false

------------------------------------------
--- Backup and swap files
------------------------------------------
-- Disable backup and swap files for better performance
opt.backup = false
opt.writebackup = false
opt.swapfile = false

------------------------------------------
--- Filetype detection
------------------------------------------
cmd('filetype plugin indent on')
