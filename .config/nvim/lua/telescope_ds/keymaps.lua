-- lua/telescope/keymaps.lua
local M = {}

M.telescope = {
	{ "<leader>pD", "<cmd>lua require('telescope.pickers').dotfiles()<cr>", desc = "Dotfile picker" },
	{ "<leader>pS", "<cmd>lua require('telescope.pickers').dotfiles_grep()<cr>", desc = "Dotfile live grep" },
	{ "<leader>pf", "<cmd>lua require('telescope.pickers').smart_files()<cr>", desc = "Repo/normal picker" },
	{ "<leader>pF", "<cmd>Telescope find_files<cr>", desc = "Find files" },
	{ "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
	{ "<leader>pw", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },
	{ "<leader>pb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>po", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
	{ "<leader>pt", "<cmd>Telescope treesitter<cr>", desc = "Treesitter symbols" },
	{ "<leader>pr", "<cmd>Telescope resume<cr>", desc = "Resume search" },
	{ "<leader>pR", "<cmd>Telescope pickers<cr>", desc = "Recent pickers" },
	{ "<leader>vh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
	{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
	{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
	{ "<leader>pn", "<cmd>TodoTelescope<cr>", desc = "TODO list" },
}

return M.telescope
