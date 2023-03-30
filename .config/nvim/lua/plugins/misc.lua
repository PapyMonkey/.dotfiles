--------------------------------------------------------------------------------
--  __  __ _             _______           _     
-- |  \/  (_)___  ___   / /_   _|__   ___ | |___ 
-- | |\/| | / __|/ __| / /  | |/ _ \ / _ \| / __|
-- | |  | | \__ \ (__ / /   | | (_) | (_) | \__ \
-- |_|  |_|_|___/\___/_/    |_|\___/ \___/|_|___/
--                                               
--------------------------------------------------------------------------------
return {
	-- Continuously updated session files 
    'tpope/vim-obsession',

    { -- Provides mappings to easily delete, change and add 'surroundings' in pairs
		'tpope/vim-surround',
		lazy = true,
		keys = {
			{'cs', desc = 'Change surroundings'},
		},
	},

    { -- Easily comment stuff
        'numToStr/Comment.nvim',
		lazy = false,
		dependencies = {
			'JoosepAlviste/nvim-ts-context-commentstring',
		},
		config = function()
			require('Comment').setup {
				pre_hook = function(ctx)
					local U = require 'Comment.utils'
					local location = nil
					if ctx.ctype == U.ctype.block then
						location = require('ts_context_commentstring.utils').get_cursor_location()
					elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
						location = require('ts_context_commentstring.utils').get_visual_start_location()
					end
					return require('ts_context_commentstring.internal').calculate_commentstring {
						key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
						location = location,
					}
				end,
			}
		end,
    },


	{ -- Documentation generator
		'kkoomen/vim-doge',
		build = ':call doge#install()',
		lazy = true,
		cmd = 'DogeGenerate',
		keys = { {'<leader>do', '<cmd>DogeGenerate<cr>', desc = 'Documentation generator'} },
		opts = true,
	},

	{ -- Todo
		'folke/todo-comments.nvim',
		lazy = true,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
		},
		opts = true,
		keys = { {'<leader>pn', '<cmd>TodoTelescope<cr>', desc = 'TODO list'} },
	},

	{ -- Simple undo history visualizer
		'mbbill/undotree',
		cond = false,
		lazy = true,
		keys = { {'<leader>u', '<cmd>UndotreeToggle<cr>'}, desc = 'Undotree'},
	},

    { -- LF
		'ptzz/lf.vim',
		lazy = true,
		dependencies = {'voldikss/vim-floaterm'},
		keys = { {'<leader>f', '<cmd>Lf<cr>'}, desc = 'Lf (file manager)'},
	},

    { -- Git : better diff
		'sindrets/diffview.nvim',
		lazy = true,
		dependencies = 'nvim-lua/plenary.nvim',
		cmd = {
			'DiffviewOpen',
			'DiffviewClose',
			'DiffviewToggleFiles',
			'DiffviewFocusFiles'
		},
		config = true,
		keys = { { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'DiffView' } },
	},

    { -- Git : blame
		'f-person/git-blame.nvim', -- Git blamer (like VS-Code)
		config = function()
			local blame_options = {
				gitblame_enabled = 1,
				gitblame_delay = 1000,

				gitblame_message_when_not_committed = ' Not committed yet',

				--[[
				<author>
				<committer>
				<date>
				<committer-date>
				<summary>
				<sha>
				]]
				gitblame_message_template = '    <committer> (<date>) • <summary> ',
				gitblame_date_format = '%r',

				gitblame_display_virtual_text = 1,
				--[[ gitblame_ignored_filetypes = {'lua', 'c'}, ]]
			}

			for key, value in pairs(blame_options) do
				vim.g[key] = value
			end

			local Remap = require('core.keymaps_utils')
			local nnoremap = Remap.nnoremap
			nnoremap('<leader>gB', ':GitBlameToggle<CR>');
			nnoremap('<leader>go', ':GitBlameOpenCommitURL<CR>');
		end,
	},

}
