return {
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
				},
			})
		end,
	},
}
