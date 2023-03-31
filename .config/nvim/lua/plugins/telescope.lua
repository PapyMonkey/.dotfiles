--------------------------------------------------------------------------------
--  _____    _                                
-- |_   _|__| | ___  ___  ___ ___  _ __   ___ 
--   | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
--   | |  __/ |  __/\__ \ (_| (_) | |_) |  __/
--   |_|\___|_|\___||___/\___\___/| .__/ \___|
--                                |_|         
--------------------------------------------------------------------------------
return {
	'nvim-telescope/telescope.nvim',
	lazy = true,
	dependencies = {
		{'nvim-lua/plenary.nvim'},
		{'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}, -- fzf integration
		{'nvim-telescope/telescope-media-files.nvim'}, -- Media preview
		{'debugloop/telescope-undo.nvim'}, -- Undo tree
		{
			'AckslD/nvim-neoclip.lua',
			dependencies = 'kkharji/sqlite.lua',
			config = function()
				local function is_whitespace(line)
					return vim.fn.match(line, [[^\s*$]]) ~= -1
				end
				local function all(tbl, check)
					for _, entry in ipairs(tbl) do
						if not check(entry) then
							return false
						end
					end
					return true
				end
				require('neoclip').setup{
					enable_persistent_history = true,
					continuous_sync = true,
					filter = function(data)
						return not all(data.event.regcontents, is_whitespace)
					end,
					keys = {
						telescope = {
							i = {
								select = '<cr>',
								paste = '<c-p>',
								paste_behind = '<c-P>',
								replay = '<c-q>',  -- replay a macro
								delete = '<c-d>',  -- delete an entry
								edit = '<c-e>',  -- edit an entry
							},
							n = {
								select = '<cr>',
								paste = 'p',
								paste_behind = 'P',
								replay = 'q',
								delete = 'd',
								edit = 'e',
							},
						},
					},
				}
			end,
		},
	},
	keys = {
		{
			'<leader>pD',
			function()
				local i, dotfiles_array = 0, {}
				local dotfiles_ls = io.popen('/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files')
				if not dotfiles_ls then
					return
				end
				for filename in dotfiles_ls:lines() do
					i = i + 1
					dotfiles_array[i] = filename
				end
				dotfiles_ls:close()

				require('telescope.builtin').find_files {
					prompt_title='Dotfiles',
					cwd = '$HOME',
					search_dirs=dotfiles_array,
				}
			end,
			desc = 'Dotfile picker',
		},
		{
			'<leader>pf',
			function()
				local _, ret, _ = require('telescope.utils').get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
				if ret == 0 then
					require('telescope.builtin').git_files()
				else
					require('telescope.builtin').find_files()
				end
			end,
			desc = 'Repo/normal picker',
		},
		-- Builtin pickers
		{'<leader>pF',	'<cmd>Telescope find_files<cr>'},
		{'<leader>ps',	'<cmd>Telescope live_grep<cr>'},
		{'<leader>pw',	'<cmd>Telescope grep_string<cr>'},
		{'<leader>pb',	'<cmd>Telescope buffers<cr>'},
		{'<leader>po',	'<cmd>Telescope oldfiles<cr>'},
		{'<leader>pt',	'<cmd>Telescope treesitter<cr>'},
		{'<leader>pr',	'<cmd>Telescope resume<cr>'},
		{'<leader>pR',	'<cmd>Telescope pickers<cr>'},
		-- Help
		{'<leader>vh',	'<cmd>Telescope help_tags<cr>'},
		-- Git pickers
		{'<leader>gb',	'<cmd>Telescope git_branches<cr>'},
		{'<leader>gc',	'<cmd>Telescope git_bcommits<cr>'},
		{'<leader>gs',	'<cmd>Telescope git_status<cr>'},
		-- Extensions
		{'<leader>u',	'<cmd>Telescope undo<cr>', desc = 'Telescope extension : undo'},
		{'<leader>pp',	'<cmd>Telescope neoclip<cr>', desc = 'Telescope extension : neoclip'},
	},
	config = function()
		local actions = require 'telescope.actions'
		require('telescope').setup {
			defaults = {
				prompt_prefix = ' ',
				selection_caret = ' ',
				mappings = {
					i = {
						['<C-n>'] = actions.cycle_history_next,
						['<C-p>'] = actions.cycle_history_prev,

						['<C-j>'] = actions.move_selection_next,
						['<C-k>'] = actions.move_selection_previous,

						['<C-c>'] = actions.close,

						['<Down>'] = actions.move_selection_next,
						['<Up>'] = actions.move_selection_previous,

						['<CR>'] = actions.select_default,
						['<C-h>'] = actions.select_horizontal,
						['<C-v>'] = actions.select_vertical,
						['<C-t>'] = actions.select_tab,

						['<C-u>'] = actions.preview_scrolling_up,
						['<C-d>'] = actions.preview_scrolling_down,

						['<PageUp>'] = actions.results_scrolling_up,
						['<PageDown>'] = actions.results_scrolling_down,

						['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
						['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
						['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
						['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
						['<C-l>'] = actions.complete_tag,
						['<C-_>'] = actions.which_key, -- keys from pressing <C-/>

						['<C-x>'] = actions.delete_buffer
					},

					n = {
						['<esc>'] = actions.close,
						['<CR>'] = actions.select_default,
						['<C-h>'] = actions.select_horizontal,
						['<C-v>'] = actions.select_vertical,
						['<C-t>'] = actions.select_tab,

						['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
						['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
						['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
						['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

						['j'] = actions.move_selection_next,
						['k'] = actions.move_selection_previous,
						['H'] = actions.move_to_top,
						['M'] = actions.move_to_middle,
						['L'] = actions.move_to_bottom,

						['<Down>'] = actions.move_selection_next,
						['<Up>'] = actions.move_selection_previous,
						['gg'] = actions.move_to_top,
						['G'] = actions.move_to_bottom,

						['<C-u>'] = actions.preview_scrolling_up,
						['<C-d>'] = actions.preview_scrolling_down,

						['<PageUp>'] = actions.results_scrolling_up,
						['<PageDown>'] = actions.results_scrolling_down,

						['?'] = actions.which_key,
					},
				},
				file_ignore_patterns = {
					'.git/',
					'.cache',
					'%.o',
					'%.out',
					'%.class',
					'%.pdf',
				},
				cache_picker = {
					num_pickers = -1,
					limit_entries = 1000,
				},
			},
			pickers = {
				buffers = {
					initial_mode = 'insert',
					sort_lastused = true,
				},
				grep_string = {
					initial_mode = 'insert',
				},
				oldfiles = {
					initial_mode = 'insert',
					sort_lastused = true,
				},
				find_files = {
					find_command = {
						'rg',
						'--files',
						'--hidden',
						'--glob',
						'!.git/*'
					},
				},
				resume = {
					initial_mode = 'insert',
				},
				pickers = {
					initial_mode = 'insert',
				},
			},
			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {'png', 'jpg', 'mp4', 'webm', 'pdf'}
					filetypes = {'png', 'webp', 'jpg', 'jpeg'},
					find_cmd = 'rg' -- find command (defaults to `fd`)
				},
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = 'smart_case',        -- or 'ignore_case' or 'respect_case'
					-- the default case_mode is 'smart_case'
				},
				undo = {
					-- No options for now
				},
				neoclip = {
					-- Options are set in the dependencies array
				},
			},
		}
		require('telescope').load_extension('media_files')
		require('telescope').load_extension('fzf')
		require('telescope').load_extension('undo')
		require('telescope').load_extension('neoclip')
	end,
}
