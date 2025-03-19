return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"autopep8",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,

		opts = {
			ensure_installed = {
				"eslint",
				"ts_ls",
				"yamlls",
				"graphql",
				"html",
				"tailwindcss",
				"cssls",
				"bashls",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"gopls",
				"nil_ls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		opts = {
			servers = {
				eslint = {},
				ts_ls = {},
				graphql = {},
				html = {},
				tailwindcss = {},
				cssls = {},
				bashls = {},
				lua_ls = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				pyright = {},
				rust_analyzer = {},
				gopls = {},
				yamlls = {},
				nil_ls = {
					formatting = {
						command = { "nixfmt" },
					},
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")

			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			vim.keymap.set("n", "<leader>co", function() end, { desc = "Show all code actions" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover symbol" })
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename" })
		end,
	},
}
