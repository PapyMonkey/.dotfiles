return {
	{
		name = "treesitter",
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate", -- Recommended build command
		event = { "BufReadPost", "BufNewFile" },

		dependencies = {
			{ -- Enhanced code navigation
				name = "treesitter-textobjects",
				"nvim-treesitter/nvim-treesitter-textobjects",

				event = { "BufReadPost", "BufNewFile" },
			},
			{ -- Auto-close HTML tags
				name = "treesitter-autotag",
				"windwp/nvim-ts-autotag",

				event = { "BufReadPost", "BufNewFile" },
			},
			{
				name = "treesitter-context",
				"treesitter-context",

				event = { "BufReadPost", "BufNewFile" },
			},
		},

		config = function()
			require("nvim-treesitter.configs").setup({
				-- Core functionality
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"go",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"markdown",
					"python",
					"rust",
					"typescript",
					"vim",
					"yaml",
					-- Useful ones :
					"dockerfile",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
				},

				-- Syntax highlighting
				highlight = {
					enable = true,
					disable = { "latex" }, -- Disable for problematic parsers
					additional_vim_regex_highlighting = false, -- Better performance
				},

				-- Indentation (may conflict with LSP)
				indent = {
					enable = true,
					disable = { "python" }, -- Let python-lsp-server handle indentation
				},

				-- Incremental selection
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},

				-- Text objects (e.g., 'af' for outer function)
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},

				-- Auto-tag for HTML/JSX
				autotag = {
					enable = true,
					filetypes = { "html", "javascript", "typescript", "jsx", "tsx" },
				},

				-- Rainbow parentheses
				rainbow = {
					enable = true,
					extended_mode = true, -- Highlight full bracket hierarchy
					max_file_lines = 3000, -- Disable for large files
				},

				-- Performance optimizations
				sync_install = false, -- Async installation
				auto_install = true, -- Install parsers for new filetypes
				ignore_install = {}, -- Problematic parsers to skip
			})
		end,
	},

	-- Separate declaration for context plugin
	{
		name = "treesitter-context",
		"nvim-treesitter/nvim-treesitter-context",

		opts = {
			max_lines = 3, -- How many lines to show
			min_window_height = 15, -- Minimum editor height
			line_numbers = true,
		},
	},
}
