-- enhanced lsp uis
return {
	name = "lspsaga",
	"glepnir/lspsaga.nvim",

	lazy = true,
	event = "LspAttach",

	branch = "main",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},

	config = true,
}
