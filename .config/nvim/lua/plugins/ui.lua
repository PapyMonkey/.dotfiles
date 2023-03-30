-------------------------------------------------------------------------------
--  _   _ ___ 
-- | | | |_ _|
-- | | | || | 
-- | |_| || | 
--  \___/|___|
--
--------------------------------------------------------------------------------
return {
    { -- Dark solarized theme
		'ishan9299/nvim-solarized-lua',
		lazy = false,
		priority = 1000,
		config = function()
			local colorscheme = 'solarized'
			local status_ok, solarized = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
			if not status_ok then
				vim.notify('colorscheme ' .. colorscheme .. ' not found!')
				return
			end
		end,
	},

	{ -- Powerline
		'nvim-lualine/lualine.nvim',
		lazy = false,
		priority = 900,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			opt = true
		},
		config = function()
			require('lualine').setup {
				options = {
					icons_enabled = true,
					theme = require('lualine.themes.solarized_dark'),
					component_separators = { left = '', right = ''},
					section_separators = { left = '', right = ''},
					disabled_filetypes = {},
					always_divide_middle = true,
					globalstatus = false,
				},
				sections = {
					lualine_a = {'mode'},
					lualine_b = {'branch', 'diff', 'diagnostics'},
					lualine_c = {'filename'},
					lualine_x = {'encoding', 'fileformat', 'filetype'},
					lualine_y = {'progress'},
					lualine_z = {'location'}
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {'filename'},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {}
				},
				tabline = {},
				extensions = {}
			}
		end,
	},

	{ -- Homepage
		'goolord/alpha-nvim',
		lazy = false,
		priority = 950,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function ()
			require('alpha').setup(
			require('alpha.themes.startify').config
			)
		end
	},

	{ -- Allows split windows to be maximized
		'szw/vim-maximizer',
		lazy = true,
		keys = { {'<leader>sm', '<cmd>MaximizerToggle<cr>', desc = 'Maximize pane'} },
	},

	-- Close buffers without closing windows
    'moll/vim-bbye',

	-- tmux and split windows navigation
    'christoomey/vim-tmux-navigator',

	-- Git decorations on left bar
	'lewis6991/gitsigns.nvim',

	{ -- Zen mode
		'folke/zen-mode.nvim',
		lazy = true,
		keys = { {'<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode'} },
		opts = true,
	},

	{ -- Screensaver
		'folke/drop.nvim',
		lazy = false,
		opts = {
			theme = 'leaves',
			max = 40,
			interval = 150, -- every 150ms we update the drops
			screensaver = 1000 * 60 * 5,
			filetypes = { 'dashboard', 'alpha', 'starter' },
		},
	},

	{ -- Notifications
		'folke/noice.nvim',
		cond = false,
		lazy = false,
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
		config = function()
			require('noice').setup {
				-- add any options here
			}
		end,
	},
}
