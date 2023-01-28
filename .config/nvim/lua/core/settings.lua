local opt = vim.opt

-- line numbers
opt.number          = true
opt.relativenumber  = true

-- tabs & identation
opt.tabstop         = 2
opt.softtabstop     = 2
opt.shiftwidth      = 2
opt.expandtab       = true
opt.smartindent     = true

-- search settings
opt.ignorecase      = true
opt.smartcase       = true
opt.hlsearch        = false

-- appearance
opt.termguicolors   = true
opt.background      = "dark"
opt.signcolumn      = "yes"
opt.colorcolumn     = "80"
opt.cursorline      = true

-- file options
opt.swapfile        = false
opt.backup          = false
opt.undodir         = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile        = true

-- misc
opt.backspace       = "indent,eol,start"
opt.updatetime      = 50
opt.wrap            = false -- line wrap
opt.splitright      = true
opt.splitbelow      = true
opt.iskeyword       :append("-") -- treat - as a word character
-- opt.path            :append("**") -- add all folders and subfolders to path
-- opt.laststatus      = 3 -- global status bar

-- set absolute line numbers on inset mode
vim.cmd([[ autocmd InsertEnter * :set norelativenumber ]])
vim.cmd([[ autocmd InsertLeave * :set relativenumber ]])

-- nvim-tree options
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- don't show mode on command line
vim.cmd([[ set noshowmode ]])
