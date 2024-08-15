return {
	"stevearc/conform.nvim",
	opts = {
		async = true,
		timeout_ms = 500,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			go = { "gofumpt" },
			templ = { "templ" },
		},
		format_on_save = {
			timeout_ms = 500,
			stop_after_first = true,
		},
	},
}
