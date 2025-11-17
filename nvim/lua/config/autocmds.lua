vim.api.nvim_create_autocmd("FileType", {
	pattern = "fugitive",
	callback = function()
		vim.keymap.set("n", "sp", function()
			local line = vim.api.nvim_get_current_line()
			-- Extract the filepath (everything after the status indicator)
			local file = line:match("^%s*%S+%s+(.+)$")
			if file then
				vim.cmd("Git stash push -- " .. vim.fn.fnameescape(file))
			else
				print("No file found on current line")
			end

			vim.keymap.set("n", "ps", ":Git stash pop<CR>", { buffer = true })
		end, { buffer = true })
	end,
})
