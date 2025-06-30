return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	config = function()
		require("rose-pine").setup({
			variant = "main",
			dark_variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			styles = {
				italic = false,
				transparency = true,
			},
		})

		vim.cmd("colorscheme rose-pine") -- setting
	end,
}
