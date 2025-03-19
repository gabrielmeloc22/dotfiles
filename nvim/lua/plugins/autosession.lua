return {
	"rmagatti/auto-session",
	lazy = false,
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Downloads", "/" },
		auto_save = true,
		-- log_level = 'debug',
	},
}
