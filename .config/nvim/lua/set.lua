vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.g.netrw_banner = 0

vim.opt.guicursor = { "n-v-c-sm:block", "i-ci-ve:ver25", "r-cr-o:hor20" }

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.scrolloff = 10

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.mouse = nil

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
