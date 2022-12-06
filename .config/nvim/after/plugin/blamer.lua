local blamer_options = {
	blamer_enabled = "0",
	blamer_delay = "1000",

	blamer_show_in_visual_modes = "1",
	blamer_show_in_insert_modes = "0",

	blamer_prefix = " ",

	--[[
	<author>
	<author-mail>
	<author-time>
	<committer>
	<committer-mail>
	<committer-time>
	<summary>
	<commit-short>
	<commit-long>
	]]
	blamer_template = "<committer> (<author-time>) - <summary>",
	blamer_date_format = "%d%m%y",

	blamer_relative_time = "0"
}

for key, value in pairs(blamer_options) do
	vim.g[key] = value
end
