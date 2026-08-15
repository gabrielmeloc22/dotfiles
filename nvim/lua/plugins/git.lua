return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
					map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })

					map("v", "<leader>hs", function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Stage selected hunk" })

					map("v", "<leader>hr", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Reset slected hunk" })

					map("n", "<leader>sb", gitsigns.stage_buffer, { desc = "Stage buffer" })
					map("n", "<leader>rb", gitsigns.reset_buffer, { desc = "Reset buffer" })

					map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
					map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

					map("n", "<leader>hb", function()
						gitsigns.blame_line({ full = true })
					end, { desc = "Blame line" })

					map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff this against index" })
					map("n", "<leader>hD", "<cmd>wincmd p | q<cr>", { desc = "Revert diff view" })

					map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
					map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
				end,
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		keys = {
			{ "<leader>gd", ":Gdiffsplit<cr>", desc = "Open buffer split diff" },
			{ "<leader>gc", ":Gvdiffsplit!<cr>", desc = "Open three-way diff view" },
			{ "<leader>gs", ":Gedit :<cr>", desc = "Open git status" },
			{ "<leader>gb", ":Git blame<cr>", desc = "Open current buffer blame" },
			{ "<leader>gr", ":GBrowse<cr>", desc = "Open git file in the browser" },
			{ "<leader>gq", ":0Gclog<cr>", desc = "Open file buffer past revisions" },
			{ "<leader>gl", ":rightbelow vertical Git log<cr>", desc = "Open git log" },
			{ "<leader>al", ":diffget //2<cr>", desc = "Accept from left below the cursor" },
			{ "<leader>ar", ":diffget //3<cr>", desc = "Accept from left below the cursor" },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "fugitive",
				callback = function(event)
					vim.keymap.del("n", "-", { buffer = event.buf })

					vim.keymap.set("n", "gP", ":Git stash pop<CR>", { buffer = true })
					vim.keymap.set("n", "gp", function()
						local line = vim.api.nvim_get_current_line()
						-- Extract the filepath (everything after the status indicator)
						local file = line:match("^%s*%S+%s+(.+)$")
						if file then
							vim.cmd("Git stash push -- " .. vim.fn.fnameescape(file))
						else
							print("No file found on current line")
						end
					end, { buffer = true })
				end,
			})
		end,
	},
	{
		"tpope/vim-rhubarb",
		event = "VeryLazy",
	},
}
