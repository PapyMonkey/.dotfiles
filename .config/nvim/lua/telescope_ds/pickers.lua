-- lua/telescope/pickers.lua
local M = {}

function M.dotfiles()
	local dotfiles = {}
	local handle = io.popen("git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files ':!:*.ttf'")
	if handle then
		for filename in handle:lines() do
			table.insert(dotfiles, filename)
		end
		handle:close()
	end

	require("telescope.builtin").find_files({
		prompt_title = " Dotfiles",
		cwd = vim.env.HOME,
		search_dirs = dotfiles,
		hidden = true,
	})
end

function M.dotfiles_grep()
	local dotfiles = {}
	local handle = io.popen("git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files ':!:*.ttf'")
	if handle then
		for filename in handle:lines() do
			table.insert(dotfiles, filename)
		end
		handle:close()
	end

	require("telescope.builtin").live_grep({
		prompt_title = " Grep Dotfiles",
		cwd = vim.env.HOME,
		search_dirs = dotfiles,
		hidden = true,
	})
end

function M.smart_files()
	local is_git = vim.fn.system("git rev-parse --is-inside-work-tree"):match("true")
	if is_git then
		require("telescope.builtin").git_files()
	else
		require("telescope.builtin").find_files()
	end
end

return M
