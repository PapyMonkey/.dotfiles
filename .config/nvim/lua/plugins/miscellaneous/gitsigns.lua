-- Git decorations on left bar
return {
	name = "gitsigns",
	"lewis6991/gitsigns.nvim",

	lazy = true,
	event = { "BufReadPost", "BufNewFile" },

	config = function()
		require("gitsigns").setup()
	end,
}
