-- Git : blame
return {
	name = "blame",
	"f-person/git-blame.nvim", -- Git blamer (like VS-Code)

	config = function()
		local blame_options = {
			gitblame_enabled = 1,
			gitblame_delay = 1000,

			gitblame_message_when_not_committed = " Not committed yet",

			--[[
				<author>
				<committer>
				<date>
				<committer-date>
				<summary>
				<sha>
				]]
			gitblame_message_template = "    <committer> (<date>) • <summary> ",
			gitblame_date_format = "%r",

			gitblame_display_virtual_text = 1,
			--[[ gitblame_ignored_filetypes = {'lua', 'c'}, ]]
		}

		for key, value in pairs(blame_options) do
			vim.g[key] = value
		end

		local Remap = require("core.keymaps_utils")
		local nnoremap = Remap.nnoremap
		nnoremap("<leader>gB", ":GitBlameToggle<CR>")
		nnoremap("<leader>go", ":GitBlameOpenCommitURL<CR>")
	end,
}
