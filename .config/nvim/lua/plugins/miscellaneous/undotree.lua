-- Simple undo history visualizer
return {
	name = "undotree",
	"mbbill/undotree",

	lazy = true,
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>" },
		desc = "Undotree",
	},
}
