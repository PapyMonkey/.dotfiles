-- 42 header
return {
	name = "42-header",
	"42Paris/42header",

	lazy = true,
	cmd = "Stdheader",

	config = function()
		vim.g.user42 = "aguiri"
		vim.g.mail42 = "aguiri@student.42nice.fr"
	end,
}
