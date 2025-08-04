local function on_attach(_, bufnr)
	local function lsp_map(key, func, mode)
		vim.keymap.set(mode or "n", key, func, { buffer = bufnr })
	end

	local telescope_builtin = require("telescope.builtin")

	lsp_map("<leader>rn", vim.lsp.buf.rename)
	lsp_map("<leader>ca", vim.lsp.buf.code_action)

	lsp_map("gd", vim.lsp.buf.definition)
	lsp_map("gr", telescope_builtin.lsp_references)
	lsp_map("gi", telescope_builtin.lsp_implementations)
	lsp_map("gD", vim.lsp.buf.type_definition)
	lsp_map("<leader>ds", telescope_builtin.lsp_document_symbols)
	lsp_map("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols)

	lsp_map("K", vim.lsp.buf.hover)

	lsp_map("<leader>D", vim.lsp.buf.declaration)
	lsp_map("<leader>f", function()
		require("conform").format({ bufnr = bufnr })
	end)
	lsp_map("<leader>u", vim.cmd.UndotreeToggle)

	lsp_map("[d", vim.diagnostic.goto_prev)
	lsp_map("]d", vim.diagnostic.goto_next)
	lsp_map("<leader>e", vim.diagnostic.open_float)
	lsp_map("<leader>q", vim.diagnostic.setloclist)
end

return {
	"mason-org/mason-lspconfig.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-jdtls",
		{
			"saghen/blink.cmp",
			version = "*",

			---@module 'blink.cmp'
			---@type blink.cmp.Config
			opts = {
				keymap = { preset = "default" },

				appearance = {
					use_nvim_cmp_as_default = true,
					nerd_font_variant = "mono",
				},

				signature = { enabled = true },
				sources = {
					default = { "snippets", "lsp", "path", "buffer" },
				},
			},
		},
	},
	config = function()
		local servers = {
			zls = {},
			clangd = {},
			ts_ls = {},
			html = { filetypes = { "html", "twig", "hbs", "templ" } },
			htmx = { filetypes = { "html", "templ" } },
			cssls = {},
			cssmodules_ls = {},
			tailwindcss = {
				filetypes = { "html", "templ", "javascript", "typescript", "javascriptreact", "typescriptreact" },
				init_options = { userLanguages = { templ = "html" } },
			},
			yamlls = {},
			dockerls = {},
			docker_compose_language_service = {},
			bashls = {},
			lua_ls = {
				Lua = {
					telemetry = { enable = false },
					workspace = {
						checkThirdParty = false,
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
			eslint = {},
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				gofumpt = true,
			},
			jdtls = {},
			sqlls = {},
		}

		local masonConf = require("mason-lspconfig")
		local capabilites = require("blink.cmp").get_lsp_capabilities()

		masonConf.setup({
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = true,
		})

		for name, server in pairs(servers) do
			vim.lsp.config(name, {
				capabilities = capabilites,
				on_attach = on_attach,
				settings = server,
				filetypes = (server or {}).filetypes,
			})
		end

		vim.lsp.config("sourcekit", {
			capabilities = {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			},
		})
	end,
}
