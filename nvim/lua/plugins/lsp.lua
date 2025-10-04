return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"autopep8",
					"shellcheck",
					"shfmt",
					"prettierd",
				},
				run_on_start = true,
				auto_update = true,
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"b0o/schemastore.nvim",
			{ "mason-org/mason.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover symbol" })
					vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Lsp Rename" })
					vim.keymap.set(
						"n",
						"<leader>cD",
						vim.diagnostic.setqflist,
						{ desc = "Show all diagnostics for current file" }
					)

					local client = vim.lsp.get_client_by_id(event.data.client_id)

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({
									group = "lsp-highlight",
									buffer = event2.buf,
								})
							end,
						})
					end
				end,
			})

			local servers = {
				eslint = {
					on_attach = function(_, bufnr)
						vim.env.ESLINT_D_PPID = vim.fn.getpid()
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							command = "EslintFixAll",
						})
					end,
				},
				ts_ls = {},
				html = {},
				tailwindcss = {},
				cssls = {},
				bashls = {
					on_attach = function(_, bufnr)
						local bufname = vim.api.nvim_buf_get_name(bufnr)
						if string.match(bufname, "%.env") then
							vim.diagnostic.enable(false, { bufnr = bufnr })
						end
					end,
				},
				pyright = {},
				rust_analyzer = {},
				gopls = {},
				jsonls = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
				yamlls = {},
				buf_ls = {},
				lua_ls = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			}

			local server_names = vim.tbl_keys(servers)

			for server, settings in pairs(servers) do
				vim.lsp.enable(server)
				vim.lsp.config(server, settings)
			end

			require("mason-lspconfig").setup({
				ensure_installed = server_names,
				automatic_enable = false,
			})
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			cmdline = {
				keymap = { preset = "inherit" },
				completion = { ghost_text = { enabled = false } },
			},
			keymap = {
				preset = "default",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
				["<CR>"] = { "select_and_accept", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					draw = {
						columns = {
							{ "label", "label_description" },
							{ "kind_icon", "kind", gap = 2 },
						},
					},
				},
				documentation = {
					auto_show = true,
				},
				list = {
					selection = {
						auto_insert = false,
						preselect = false,
					},
				},
				ghost_text = { enabled = false },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
