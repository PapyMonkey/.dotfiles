local function get_dotfiles()
	local i, dotfiles_array = 0, {}
	local handle = io.popen("/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files ':!:*.ttf'")
	if not handle then
		return {}
	end
	for filename in handle:lines() do
		i = i + 1
		dotfiles_array[i] = filename
	end
	handle:close()
	return dotfiles_array
end

return {
	{
		"<leader>pD",
		function()
			require("telescope.builtin").find_files({
				prompt_title = "Dotfiles",
				cwd = "$HOME",
				search_dirs = get_dotfiles(),
			})
		end,
		desc = "Dotfile picker",
	},
	{
		"<leader>pS",
		function()
			require("telescope.builtin").live_grep({
				prompt_title = "Live grep in dotfiles",
				cwd = "$HOME",
				search_dirs = get_dotfiles(),
			})
		end,
		desc = "Dotfile live grep",
	},
	{
		"<leader>pf",
		function()
			local _, ret =
				require("telescope.utils").get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
			if ret == 0 then
				require("telescope.builtin").git_files()
			else
				require("telescope.builtin").find_files()
			end
		end,
		desc = "Repo/normal picker",
	},
	{ "<leader>pF", "<cmd>Telescope find_files<cr>" },
	{ "<leader>ps", "<cmd>Telescope live_grep<cr>" },
	{ "<leader>pw", "<cmd>Telescope grep_string<cr>" },
	{ "<leader>pb", "<cmd>Telescope buffers<cr>" },
	{ "<leader>po", "<cmd>Telescope oldfiles<cr>" },
	{ "<leader>pt", "<cmd>Telescope treesitter<cr>" },
	{ "<leader>pr", "<cmd>Telescope resume<cr>" },
	{ "<leader>pR", "<cmd>Telescope pickers<cr>" },
	{ "<leader>vh", "<cmd>Telescope help_tags<cr>" },
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>" },
	{ "<leader>gc", "<cmd>Telescope git_bcommits<cr>" },
	{ "<leader>gs", "<cmd>Telescope git_status<cr>" },
	{ "<leader>pn", "<cmd>TodoTelescope<cr>", desc = "TODO list" },
}
