return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		{ "folke/neodev.nvim", opts = {} },
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
			},
		},
	},
	config = function()
		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr }
			local telescope_builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts)
			vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>ds", telescope_builtin.lsp_document_symbols, opts)
			vim.keymap.set("n", "<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, opts)

			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

			vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({ bufnr = bufnr })
			end, opts)
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, opts)

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
		end

		local servers = {
			rust_analyzer = {},
			hls = { filetypes = { "haskell", "lhaskell", "hk" } },
			zls = {},
			clangd = {},
			tsserver = {},
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
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		})

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})

		vim.keymap.set({ "i", "s" }, "<C-l>", function()
			luasnip.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			luasnip.jump(-1)
		end, { silent = true })

		require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		cmp.setup({
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "path" },
			},
		})
	end,
}
