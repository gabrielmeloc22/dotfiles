return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local hooks = require("ibl.hooks")
		local ibl = require("ibl")

		ibl.setup({
			indent = {
				char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
			},
			scope = {
				show_start = false,
				show_end = false,
			},
		})

		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
	end,
}
