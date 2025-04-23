-- lua/telescope/config.lua
local actions = require("telescope.actions")

local M = {}

function M.setup()
	local telescope = require("telescope")

	telescope.setup({
		defaults = M.defaults(),
		pickers = M.pickers(),
		extensions = M.extensions(),
	})

	telescope.load_extension("fzf")
	telescope.load_extension("media_files")
end

function M.defaults()
	return {
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "   ",
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = { prompt_position = "top", preview_width = 0.55 },
			vertical = { mirror = false },
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-h>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
			n = {
				["<esc>"] = actions.close,
				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,
				["<CR>"] = actions.select_default,
			},
		},
		file_ignore_patterns = {
			"^.git/",
			"^.cache",
			"%.o",
			"%.out",
			"%.class",
			"%.pdf",
			"%.mkv",
			"%.mp4",
			"%.zip",
		},
		cache_picker = {
			num_pickers = 20,
			limit_entries = 1000,
		},
		path_display = { "truncate" },
		winblend = 5,
		border = {},
		color_devicons = true,
	}
end

function M.pickers()
	return {
		find_files = {
			hidden = true,
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--glob",
				"!.git/*",
				"--glob",
				"!node_modules/*",
			},
		},
		live_grep = {
			additional_args = function()
				return { "--hidden", "--glob", "!.git/*" }
			end,
		},
		buffers = {
			initial_mode = "normal",
			sort_lastused = true,
			previewer = false,
			mappings = {
				i = { ["<c-d>"] = actions.delete_buffer },
				n = { ["d"] = actions.delete_buffer },
			},
		},
	}
end

function M.extensions()
	return {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
			find_cmd = "fd",
		},
		undo = {
			use_delta = true,
			side_by_side = true,
		},
	}
end

return M
