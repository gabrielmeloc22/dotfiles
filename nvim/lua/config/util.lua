local M = {}

local function find_git_root_from_path(start_path)
	local function has_git_dir(dir)
		local git_dir = dir .. "/.git"
		return vim.fn.isdirectory(git_dir) == 1
	end

	local function get_parent_dir(dir)
		return vim.fn.fnamemodify(dir, ":h")
	end

	local current = start_path
	local previous = nil

	while current ~= previous do
		if has_git_dir(current) then
			return current
		end
		previous = current
		current = get_parent_dir(current)
	end

	return nil
end

-- Public
function M.get_git_root()
	local buffer_dir = vim.fn.expand("%:p:h")

	if buffer_dir == "" then
		buffer_dir = vim.fn.getcwd()
	end

	local git_root = find_git_root_from_path(buffer_dir)

	if git_root then
		return git_root
	else
		vim.notify("No git repository found in current path or any parent directories", vim.log.levels.WARN)
		return nil
	end
end

return M
