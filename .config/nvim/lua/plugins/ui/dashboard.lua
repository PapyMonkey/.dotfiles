return {
	name = "dashboard",
	"nvimdev/dashboard-nvim",

	lazy = true,
	event = "VimEnter",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("dashboard").setup({
			-- config
		})
	end,
}
