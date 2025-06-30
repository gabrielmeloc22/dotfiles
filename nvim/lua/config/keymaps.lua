vim.keymap.set("n", "<leader>qq", ":qa!<CR>", { desc = "Quit all buffers" })

vim.keymap.set("n", "<leader>wq", ":q<cr>", { silent = true, desc = "Close panel" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Make splits equal" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all other split but selected" })

vim.keymap.set("n", "<M->>", "<C-w>5>", { silent = true, desc = "Increase split width" })
vim.keymap.set("n", "<M-<>", "<C-w>5<", { silent = true, desc = "Increase split width" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })

vim.keymap.set("n", "<leader>bd", "<cmd>bp | bd!#<CR>", { desc = "Close buffer" })

vim.keymap.set("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<esc>", "<cmd>nohl<CR>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down centralized" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up centralized" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search match centralized" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search match centralized" })

vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete to void register" })

vim.keymap.set("n", "<Leader>s", "<cmd>w<CR>", { silent = true, desc = "Save file" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection upwards" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection downwards" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without losing clipboard" })

vim.keymap.set("n", "<leader>df", "<cmd>e ~/.config/nvim/<CR>", { desc = "Open config files" })

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { silent = true, desc = "Open lazy" })
vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { silent = true, desc = "Open mason" })

vim.keymap.set("x", "<leader>y", '"+y', { desc = "Copy to system clipboard", noremap = true, silent = true })

vim.keymap.set("n", "<M-j>", ":cnext<cr>", { silent = true, desc = "Next quicklist item" })
vim.keymap.set("n", "<M-k>", ":cprev<cr>", { silent = true, desc = "Prev quicklist item" })

vim.keymap.set("n", "<M-k>", ":cprev<cr>", { silent = true, desc = "Prev quicklist item" })

vim.keymap.set("v", "r", ":s/", { desc = "Replace within selection" })
