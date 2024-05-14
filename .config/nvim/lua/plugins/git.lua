return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>bl", function()
				vim.cmd.Git({ "blame" })
			end)

			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
			vim.keymap.set("n", "gh", function()
				vim.cmd.diffg(2)
			end)
			vim.keymap.set("n", "gl", function()
				vim.cmd.diffg(3)
			end)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = {
					text = "+",
				},
				change = {
					text = "~",
				},
				delete = {
					text = "_",
				},
				topdelete = {
					text = "‾",
				},
				changedelete = {
					text = "~",
				},
			},
		},
	},
}
