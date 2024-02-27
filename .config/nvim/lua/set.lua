vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.wrap = false

vim.o.scrolloff = 8

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.nvim/undodir"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 50
vim.o.signcolumn = "yes"

vim.opt.termguicolors = true
vim.o.completeopt = "menuone,noselect"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_banner = 0

vim.opt.mouse = nil
