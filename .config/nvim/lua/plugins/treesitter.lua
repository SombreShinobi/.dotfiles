local langs = {
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
	"go",
	"python",
	"swift",
	"java",
	"sql",
	"markdown",
	"markdown_inline",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		event = "VeryLazy",
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
			},
		},
		config = function()
			require("nvim-treesitter").setup()

			require("nvim-treesitter").install(langs)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = langs,
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})

			vim.filetype.add({
				extension = {
					templ = "templ",
					yaml = "helm",
				},
			})
		end,
	},
}
