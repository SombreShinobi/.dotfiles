return {
	{
		"echasnovski/mini.ai",
		version = "*",
		lazy = false,
		config = function()
			local ai = require("mini.ai")
			local treesitter = ai.gen_spec.treesitter

			ai.setup({
				custom_textobjects = {
					F = treesitter({ a = "@function.outer", i = "@function.inner" }),
					c = treesitter({ a = "@class.outer", i = "@class.inner" }),
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		lazy = false,
		config = function()
			local surround = require("mini.surround")
			local treesitter = surround.gen_spec.input.treesitter

			surround.setup({
				custom_surroundings = {
					F = {
						input = treesitter({ outer = "@function.outer", inner = "@function.inner" }),
					},
					c = {
						input = treesitter({ outer = "@class.outer", inner = "@class.inner" }),
					},
				},
			})
		end,
	},
}
