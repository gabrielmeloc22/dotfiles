return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>bf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},

	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "autopep8" },
			javascript = { "prettierd", "eslint_d" },
			typescript = { "prettierd", "eslint_d" },
			typescriptreact = { "prettierd", "eslint_d" },
			sql = { "sql_formatter" },
			yaml = { "prettierd" },
			go = { "gofmt" },
			cpp = { "clang_format" },
			c = { "clang_format" },
		},
		format_after_save = { async = true, timeout_ms = 0 },
		default_format_opts = { lsp_format = "fallback" },
	},
}
