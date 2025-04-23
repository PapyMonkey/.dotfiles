return {
	name = "telescope",
	"nvim-telescope/telescope.nvim",

	lazy = true,

	dependencies = require("plugins.telescope.dependencies"),
	keys = require("plugins.telescope.keys"),
	config = function()
		require("plugins.telescope.setup").config()
	end,
}
