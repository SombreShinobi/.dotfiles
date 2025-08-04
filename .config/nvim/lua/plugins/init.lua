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
	-- Convenience
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"folke/todo-comments.nvim",
		depentencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local todo = require("todo-comments")
			todo.setup({ signs = false })

			vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>")
			vim.keymap.set("n", "<leader>tb", "<cmd>TodoTrouble<CR>")
		end,
	},
	"mbbill/undotree",
	{ "j-hui/fidget.nvim", opts = {} },
}
