return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				ignore_install = {},
				auto_install = true,
				modules = {},
				ensure_installed = {
					"c",
					"javascript",
					"jsdoc",
					"json",
					"html",
					"css",
					"scss",
					"yaml",
					"lua",
					"rust",
					"zig",
					"typescript",
					"tsx",
					"dockerfile",
					"ocaml",
					"haskell",
					"go",
					"python",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
					disable = { "python" },
				},
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context", event = "VeryLazy", opts = {} },
}
