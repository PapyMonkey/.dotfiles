-------------------------------------------------------------------------------
--  _   _ ___ 
-- | | | |_ _|
-- | | | || | 
-- | |_| || | 
--  \___/|___|
--
--------------------------------------------------------------------------------
return {
	{ -- Dark solarized theme (old one, not loaded)
		'ishan9299/nvim-solarized-lua',
		cond = false,
		lazy = false,
		priority = 1000,
		config = function()
			local colorscheme = 'solarized'
			local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
			if not status_ok then
				vim.notify('colorscheme ' .. colorscheme .. ' not found!')
				return
			end
		end,
	},

	{ -- Dark solarized theme
		'svrana/neosolarized.nvim',
		cond = true,
		lazy = false,
		priority = 1000,
		dependencies = {
			'tjdevries/colorbuddy.nvim',
		},
		opts = {
			comment_italics = true,
			background_set = true,
		},
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
		priority = 700,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function ()
			require('alpha').setup(require'alpha.themes.startify'.config)
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
		dependencies = {
			'folke/twilight.nvim',
		},
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

	{ -- auto-resize windows
		'anuvyklack/windows.nvim',
		event = 'WinNew',
		dependencies = {
			{ 'anuvyklack/middleclass' },
			{ 'anuvyklack/animation.nvim', enabled = false },
		},
		keys = { { '<leader>Z', '<cmd>WindowsMaximize<cr>', desc = 'Zoom' } },
		config = function()
			vim.o.winwidth = 5
			vim.o.equalalways = false
			require('windows').setup({
				animation = { enable = false, duration = 150 },
			})
		end,
	},

}
