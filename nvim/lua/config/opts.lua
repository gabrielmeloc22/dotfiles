local opt = vim.opt

-- keep status line always on the bottom
vim.o.laststatus = 3

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

opt.guicursor = ""

opt.number = true
opt.rnu = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.wrap = false

opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.backspace = "indent,eol,start"
opt.signcolumn = "yes"

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile = true

opt.hlsearch = false

opt.termguicolors = true

opt.scrolloff = 8
opt.updatetime = 750
