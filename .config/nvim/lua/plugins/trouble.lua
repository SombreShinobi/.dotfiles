return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local trouble = require("trouble")

		vim.keymap.set("n", "<leader>tr", function()
			trouble.toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>tw", function()
			trouble.toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>tq", function()
			trouble.toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>tn", function()
			trouble.next({ skip_groups = true, jump = true })
		end)
		vim.keymap.set("n", "<leader>tp", function()
			trouble.previous({ skip_groups = true, jump = true })
		end)
	end,
}
