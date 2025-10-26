return {
	"nvim-telescope/telescope-ui-select.nvim",
	"debugloop/telescope-undo.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			telescope.setup({
				pickers = {
					find_files = {
						file_ignore_patterns = { "node_modules", "dist", ".venv", ".git" },
						hidden = true,
					},
				},
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-x>"] = actions.delete_buffer,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					undo = {},
				},
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("undo")
			telescope.load_extension("fzf")

			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Telescope undo tree" })

			vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Telescope find files" })

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files()
			end, { desc = "Telescope find git files" })

			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope list keymaps" })

			vim.keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Telescope list keymaps" })
		end,
	},
}
