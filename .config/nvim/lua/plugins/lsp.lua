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

local function setup_servers()
	local servers = {
		rust_analyzer = {},
		hls = { filetypes = { "haskell", "lhaskell", "hk" } },
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
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
		eslint = {},
		pyright = {},
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	}
	local mason_lspconfig = require("mason-lspconfig")

	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
		automatic_installation = true,
	})

	local capabilities = require("blink.cmp").get_lsp_capabilities()

	mason_lspconfig.setup_handlers({
		function(server_name)
			local conf = require("lspconfig")
			conf[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
				filetypes = (servers[server_name] or {}).filetypes,
			})
			conf.sourcekit.setup({
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		{
			"folke/lazydev.nvim",
			opts = {
				library = { path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
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
		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
		})

		setup_servers()
	end,
}
