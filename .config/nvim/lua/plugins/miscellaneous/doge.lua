-- Documentation generator
return {
	name = "doge",
	"kkoomen/vim-doge",

	lazy = true,
	cmd = "DogeGenerate",
	build = ":call doge#install()",
	keys = {
		{ "<leader>do", "<cmd>DogeGenerate<cr>", desc = "Documentation generator" },
	},

	opts = true,
}
