return {
	name = "catppuccin",
	"catppuccin/nvim",

	lazy = false,
	priority = 1000,

	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
		-- vim.cmd.colorscheme("catppuccin-latte")
	end,

	integrations = {
		lualine = true,
	},
}
