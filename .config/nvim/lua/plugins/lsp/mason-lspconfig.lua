-- simple to language server installer
return {
	name = "mason-lspconfig",
	"williamboman/mason-lspconfig.nvim",

	dependencies = {
		"mason",
		"lspconfig",
	},

	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"arduino_language_server",
				"clangd",
				"cmake",
				"cssls",
				"gopls",
				"html",
				"jsonls",
				"ltex",
				"marksman",
				"pyright",
				"lua_ls",
				"vimls",
			},
		})
	end,
}
