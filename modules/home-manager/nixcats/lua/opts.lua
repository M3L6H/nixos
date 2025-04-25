local o = vim.opt

-- Line numbers
o.nu = true
o.rnu = true

-- Tabs
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2
o.smartindent = true
o.breakindent = true

-- Enable mouse mode
o.mouse = "a"

-- No wrapping
o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- Don't highlight searches
o.hlsearch = false
o.incsearch = true
-- Case-insensitive searching unless one or more capital letters are included in the search term
o.ignorecase = true
o.smartcase = true

-- Open new splits to the right/bottom
o.splitright = true
o.splitbelow = true

-- Display particular whitespace characters
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions
o.inccommand = "split"

-- Highlight line under cursor
o.cursorline = true

-- Mode show in statusline
o.showmode = false

o.termguicolors = true

o.cmdheight = 0

o.scrolloff = 16
o.signcolumn = "yes"
o.isfname:append("@-@")

o.updatetime = 50

-- Border
vim.g.border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }

-- Terminal window
vim.g.terminalwindow = "2"

