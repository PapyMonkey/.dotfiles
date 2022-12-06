local doge_options = {
	-- Mappings
	doge_mapping = "<Leader>z",
	doge_enable_mappings = "0",

	-- Documentation standard
	doge_doc_standard_c = "doxygen_javadoc_no_asterisk",
	doge_doc_standard_cpp = "doxygen_javadoc_no_asterisk",

	-- Comment options
	doge_comment_jump_modes = "['n', 's']"
}

for key, value in pairs(doge_options) do
	vim.g[key] = value
end
