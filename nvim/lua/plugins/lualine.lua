return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		return {
			options = {
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = {
					{ "branch", icon = "" },
				},
				lualine_c = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{
						"filename",
						padding = { left = 1, right = 0 },
						file_status = true, -- Displays file status (readonly status, modified status)
						newfile_status = false, -- Display new file status (new file means no write after created)
						path = 1, -- 0: Just the filename
						shorting_target = 40,
						symbols = {
							modified = "[+]",
							readonly = "[-]",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
				},
				lualine_x = {
					{
						"diagnostics",
						always_visible = false,
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = "󰝶 ",
						},
					},
					{ "diff" },
				},
				lualine_y = {
					{
						"progress",
					},
					{
						"location",
					},
				},
				lualine_z = {},
			},
		}
	end,
}
