--------------------------------------------------------------------------------
--  _  _  ____  
-- | || ||___ \ 
-- | || |_ __) |
-- |__   _/ __/ 
--    |_||_____|
--              
--------------------------------------------------------------------------------
return {
	{ -- 42 header
		'42Paris/42header',
		lazy = true,
		cmd = 'Stdheader',
		config = function()
			vim.g.user42 = 'aguiri'
			vim.g.mail42 = 'aguiri@student.42nice.fr'
		end,
	},

	{ -- 42 mandatory 'norminette'
		'alexandregv/norminette-vim',
		lazy = true,
		dependencies = { 'vim-syntastic/syntastic' },
		--[[ ft = 'c', ]]
		cmd = {"Norminette"},
		config = function()
			-- Enable norminette-vim (and gcc)
			vim.g.syntastic_c_checkers = {"norminette", "gcc"}
			vim.g.syntastic_aggregate_errors = 1

			-- Set the path to norminette (do no set if using norminette of 42 mac)
			vim.g.syntastic_c_norminette_exec = 'norminette'

			-- Support headers (.h)
			vim.g.c_syntax_for_h = 1
			vim.g.syntastic_c_include_dirs = {"include", "../include", "../../include", "libft", "../libft/include", "../../libft/include"}

			-- Pass custom arguments to norminette (this one ignores 42header)
			vim.g.syntastic_c_norminette_args = '-R CheckTopCommentHeader'

			-- Check errors when opening a file (disable to speed up startup time)
			vim.g.syntastic_check_on_open = 1

			-- Enable error list
			vim.g.syntastic_always_populate_loc_list = 1

			-- Automatically open error list
			vim.g.syntastic_auto_loc_list = 1

			-- Skip check when closing
			vim.g.syntastic_check_on_wq = 0
		end,
	},
}
