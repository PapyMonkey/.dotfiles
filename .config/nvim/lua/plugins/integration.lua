--------------------------------------------------------------------------------
--  ___       _                       _   _                 
-- |_ _|_ __ | |_ ___  __ _ _ __ __ _| |_(_) ___  _ __  ___ 
--  | || '_ \| __/ _ \/ _` | '__/ _` | __| |/ _ \| '_ \/ __|
--  | || | | | ||  __/ (_| | | | (_| | |_| | (_) | | | \__ \
-- |___|_| |_|\__\___|\__, |_|  \__,_|\__|_|\___/|_| |_|___/
--                    |___/                                 
--------------------------------------------------------------------------------
return {
	{ -- Git decorations on left bar
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
	},

	{ -- Lazygit
		'kdheepak/lazygit.nvim',
		lazy = true,
		keys = {
			{'<leader>gg', '<cmd>LazyGit<cr>', desc = 'Lazygit'},
		},
		config = function()
			local lazygit_options = {
				lazygit_floating_window_winblend = 0, -- transparency of floating window
				lazygit_floating_window_scaling_factor = 0.9, -- scaling factor for floating window
				lazygit_floating_window_corner_chars = { '╭', '╮', '╰', '╯' }, -- customize lazygit popup window corner characters
				lazygit_floating_window_use_plenary = 0, -- use plenary.nvim to manage floating window if available
				lazygit_use_neovim_remote = 1, -- fallback to 0 if neovim-remote is not installed
				lazygit_use_custom_config_file_path = 0, -- config file path is evaluated if this value is 1
				lazygit_config_file_path = '', -- custom config file path
			}

			for key, value in pairs(lazygit_options) do
				vim.g[key] = value
			end
		end,
	},

	{ -- Obsidian
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

	{ -- Copilot
		'zbirenbaum/copilot.lua',
		lazy = true,
		cond = false,
		cmd = "Copilot",
		event = {'InsertEnter'},
		dependencies = {
			'hrsh7th/nvim-cmp',
			'zbirenbaum/copilot-cmp',
		},
		config = function()
			require('copilot').setup {
			}
		end,
	},

	{ -- Markdown preview
		'ellisonleao/glow.nvim',
		lazy = true,
		cmd = 'Glow',
		ft = 'md',
		config = true,
	},

	{ -- Markdown preview
		'iamcco/markdown-preview.nvim',
		lazy = true,
		ft = 'markdown',
		config = function()
			vim.fn['mkdp#util#install']()
		end,
	},

	{
		'ThePrimeagen/vim-be-good',
		lazy = true,
		cmd = 'VimBeGood',
	},
}
