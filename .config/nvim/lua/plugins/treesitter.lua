--------------------------------------------------------------------------------
--  _____                   _ _   _            
-- |_   _| __ ___  ___  ___(_) |_| |_ ___ _ __ 
--   | || '__/ _ \/ _ \/ __| | __| __/ _ \ '__|
--   | || | |  __/  __/\__ \ | |_| ||  __/ |   
--   |_||_|  \___|\___||___/_|\__|\__\___|_|   
--                                             
--------------------------------------------------------------------------------
return {
	{
		'nvim-treesitter/nvim-treesitter-context',
		event = 'BufReadPre',
		config = true,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'HiPhish/nvim-ts-rainbow2',
		},
		config = function()
			require ('nvim-treesitter.configs').setup {
				ensure_installed = {
					'astro',
					'bash',
					'c',
					'cmake',
					'cpp',
					'css',
					'diff',
					'fish',
					'gitignore',
					'go',
					'graphql',
					'help',
					'html',
					'http',
					'java',
					'javascript',
					'jsdoc',
					'jsonc',
					'latex',
					'lua',
					'luap',
					'markdown',
					'markdown_inline',
					'meson',
					'ninja',
					'nix',
					'norg',
					'org',
					'php',
					'python',
					'query',
					'regex',
					'rust',
					'scss',
					'sql',
					'svelte',
					'teal',
					'toml',
					'tsx',
					'typescript',
					'vhs',
					'vim',
					'vue',
					'wgsl',
					'yaml',
					-- 'wgsl',
					'json',
					-- 'markdown',
				},
				matchup = {
					enable = true,
				},
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = { '' }, -- list of language that will be disabled
					additional_vim_regex_highlighting = true,
				},
				indent = { enable = true, disable = { '' } },
				--[[ rainbow = { ]]
				--[[ 	enable = true, ]]
				--[[ 	query = 'rainbow-parens', ]]
				--[[ 	strategy = require('ts-rainbow').strategy.global, ]]
				--[[ }, ]]
			}
		end,
	},
}
