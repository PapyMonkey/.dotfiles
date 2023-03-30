--------------------------------------------------------------------------------
--  ___       _                       _   _                 
-- |_ _|_ __ | |_ ___  __ _ _ __ __ _| |_(_) ___  _ __  ___ 
--  | || '_ \| __/ _ \/ _` | '__/ _` | __| |/ _ \| '_ \/ __|
--  | || | | | ||  __/ (_| | | | (_| | |_| | (_) | | | \__ \
-- |___|_| |_|\__\___|\__, |_|  \__,_|\__|_|\___/|_| |_|___/
--                    |___/                                 
--------------------------------------------------------------------------------
return {
	{
		'epwalsh/obsidian.nvim',
		lazy = true,
		ft = 'md',
		config = function()
			require('obsidian').setup {
				dir = '~/Documents/Mojojojo',
				completion = {
					nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
				},
				ensure_installed = { 'markdown', 'markdown_inline' },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { 'markdown' },
				},
			}
		end,
	},
}
