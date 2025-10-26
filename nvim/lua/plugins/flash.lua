return {
	"folke/flash.nvim",
	enabled = false,
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	config = function()
		require("flash").setup({
			highlight = {
				groups = {
					match = "@diff.plus", -- non‑current matches
					current = "@comment.todo", -- the one under the cursor
					label = "AvanteSubtitle", -- the jump labels
				},
			},
		})
	end,
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
}
