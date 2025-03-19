return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	event = { "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,

	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	keys = {
		{ "<C-space>", desc = "Increment Selection" },
		{ "<C-S-space>", desc = "Decrement Selection", mode = "x" },
	},

	opts_extend = { "ensure_installed" },
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"comment",
			"css",
			"html",
			"javascript",
			"jsdoc",
			"jsonc",
			"lua",
			"markdown",
			"regex",
			"scss",
			"toml",
			"typescript",
			"yaml",
			"python",
			"rust",
			"java",
			"dockerfile",
			"graphql",
		},
		auto_install = true,
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<C-S-space>",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
