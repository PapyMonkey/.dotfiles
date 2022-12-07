local obsidian_ok, obsidian = pcall(require, "obsidian")
if not obsidian_ok then
	return
end

obsidian.setup {
	dir = "~/Documents/Mojojojo",
	completion = {
		nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
	},
	ensure_installed = { "markdown", "markdown_inline" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "markdown" },
	},
}
