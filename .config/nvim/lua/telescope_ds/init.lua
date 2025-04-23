-- Amazing fuzzy finder
return {
	{
		name = "telescope",
		"nvim-telescope/telescope.nvim",

		lazy = true,

		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-media-files.nvim",
			"folke/todo-comments.nvim",
			"debugloop/telescope-undo.nvim",
		},

		keys = function()
			local km = require("telescope.keymaps")
			return km.telescope
		end,
		config = function()
			require("telescope.config").setup()
		end,
	},
}
