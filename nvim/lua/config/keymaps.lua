local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

--select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

keymap.set("n", "<C-A-l>", "<C-w>>", { desc = "Increase window left" })
keymap.set("n", "<C-A-h>", "<C-w><", { desc = "Increase window right" })
keymap.set("n", "<C-A-j>", "<C-w>+", { desc = "Increase window up" })
keymap.set("n", "<C-A-k>", "<C-w>-", { desc = "Increase window down" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down centralized" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up centralized" })
