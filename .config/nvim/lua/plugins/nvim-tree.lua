--------------------------------------------------------------------------------
--  _____              
-- |_   _| __ ___  ___ 
--   | || '__/ _ \/ _ \
--   | || | |  __/  __/
--   |_||_|  \___|\___|
--                     
--------------------------------------------------------------------------------
return {
	{
		'nvim-tree/nvim-tree.lua',

		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},

		lazy = true,

		keys = {
			{'<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'nvim-tree'}
		},

		config = function()
			local tree_cb = require('nvim-tree.config').nvim_tree_callback
			require('nvim-tree').setup {
				disable_netrw = true,
				hijack_netrw = true,
				hijack_cursor = false,
				update_cwd = true,
				diagnostics = {
					enable = true,
					icons = {
						hint = '',
						info = '',
						warning = '',
						error = '',
					},
				},
				update_focused_file = {
					enable = true,
					update_cwd = true,
					ignore_list = {},
				},
				git = {
					enable = true,
					ignore = true,
					timeout = 500,
				},
				view = {
					width = 30,
					hide_root_folder = false,
					side = 'left',
					mappings = {
						custom_only = false,
						list = {
							{ key = { 'l', '<CR>', 'o' }, cb = tree_cb 'edit' },
							{ key = 'h', cb = tree_cb 'close_node' },
							{ key = 'v', cb = tree_cb 'vsplit' },
						},
					},
					number = false,
					relativenumber = false,
				},
				renderer = {
					icons = {
						glyphs = {
							default = '',
							symlink = '',
							git = {
								unstaged = '',
								staged = 'S',
								unmerged = '',
								renamed = '➜',
								deleted = '',
								untracked = 'U',
								ignored = '◌',
							},
							folder = {
								arrow_closed = '', -- arrow when folder is closed
								arrow_open = '', -- arrow when folder is open
								default = '',
								open = '',
								empty = '',
								empty_open = '',
								symlink = '',
							},
						},
					},
				},
				-- disable window_picker for explorer to work well with
				-- window splits
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
			}
		end,
	},
}
