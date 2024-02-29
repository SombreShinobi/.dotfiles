return {
	-- UI
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				on_highlights = function(highlights)
					highlights.LineNr.fg = "#6c76a3"
				end,
			})
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	-- Git
	{
		"tpope/vim-fugitive",
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
	-- Convenience
	{ "numToStr/Comment.nvim", opts = {} },
	"mbbill/undotree",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			whitespace = {
				remove_blankline_trail = true,
			},
		},
	},
	{ "j-hui/fidget.nvim", opts = {} },
	{ "laytan/cloak.nvim", opts = {} },
	{ "echasnovski/mini.ai", version = "*", opts = {} },
	{ "echasnovski/mini.surround", version = "*", opts = {} },
}
