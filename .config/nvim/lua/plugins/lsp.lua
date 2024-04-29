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
	lsp_map("<C-h>", vim.lsp.buf.signature_help, "i")

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
end

local function setup_cmp()
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
end

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

		setup_servers()
		setup_cmp()
	end,
}
