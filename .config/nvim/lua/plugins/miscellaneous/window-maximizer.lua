-- Allows split windows to be maximized
return {
	name = "window-maximizer",
	"szw/vim-maximizer",

	lazy = true,
	keys = { { "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Maximize pane" } },
}
