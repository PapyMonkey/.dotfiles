-- Snippet completions
return {
	name = "cmp-luasnip",
	"saadparwaiz1/cmp_luasnip",

	lazy = true,

	dependencies = {
		"L3MON4D3/LuaSnip", --snippet engine
		"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	},
}
