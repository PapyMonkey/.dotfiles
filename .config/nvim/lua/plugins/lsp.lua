--------------------------------------------------------------------------------
--  _     ____  ____  
-- | |   / ___||  _ \ 
-- | |   \___ \| |_) |
-- | |___ ___) |  __/ 
-- |_____|____/|_|    
--                    
--------------------------------------------------------------------------------
return {
	{ -- enhanced lsp uis
		'glepnir/lspsaga.nvim',
		branch = 'main',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'nvim-treesitter/nvim-treesitter',
		},
		config = true,
	},

	{ -- simple to language server installer
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			{ -- simple to use lsp server
				'williamboman/mason.nvim',
				build = ':MasonUpdate',
				config = function()
				require('mason').setup {
						ui = {
							icons = {
								package_installed = '✓',
								package_pending = '➜',
								package_uninstalled = '✗',
							},
						},
					}
				end,
			},

			{ -- easily configure language servers
				'neovim/nvim-lspconfig',
				config = function()
					-- used to enable autocompletion (assign to every lsp server config)
					local capabilities = require('cmp_nvim_lsp').default_capabilities()

					-- enable keybinds only for when lsp server available
					local on_attach = function(_, bufnr)
						-- keybind options
						local opts = { noremap = true, silent = true, buffer = bufnr }

						-- set keybinds
						vim.keymap.set('n', 'gf', '<cmd>Lspsaga finder<CR>', opts) -- show definition, references
						vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
						vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts) -- see definition and make edits in window
						vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
						vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts) -- see available code actions
						vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts) -- smart rename
						vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts) -- show  diagnostics for line
						vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts) -- show diagnostics for cursor
						vim.keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
						vim.keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
						vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
						vim.keymap.set('n', '<leader>o', ':LSoutlineToggle<CR>', opts) -- see outline on right hand side
					end

					-- Change the Diagnostic symbols in the sign column (gutter)
					-- (not in youtube nvim video)
					local signs = { Error = ' ', Warn = ' ', Hint = 'ﴞ ', Info = ' ' }
					for type, icon in pairs(signs) do
						local hl = 'DiagnosticSign' .. type
						vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
					end

					-- configure bash server
					require('lspconfig')['bashls'].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}

					-- configure c server
					-- require('lspconfig')['clangd'].setup {
					-- 	capabilities = capabilities,
					-- 	single_file_support = true,
					-- 	on_attach = on_attach,
					-- 	settings = {
					-- 		header_insertion = never,
					-- 	},
					-- }

					-- configure cmake server
					require('lspconfig')['cmake'].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}

					-- configure css server
					require('lspconfig')['cssls'].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}

					-- configure go server
					require('lspconfig')['gopls'].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}

					-- configure html server
					require('lspconfig')['html'].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}

					-- configure json server
					require('lspconfig')['jsonls'].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}

					-- configure marksman server
					require('lspconfig')['marksman'].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}

					-- configure pyright server
					require('lspconfig')['pyright'].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}

					-- configure lua server
					require('lspconfig')['lua_ls'].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { 'vim' },
								},
							},
						},
					}
				end,

			},
		},
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = {
					'arduino_language_server',
					'clangd',
					'cmake',
					-- 'cssls',
					'gopls',
					-- 'html',
					-- 'jsonls',
					'ltex',
					'marksman',
					'pyright',
					'lua_ls',
					'vimls'
				},
			}
		end,
	},

	-- vs-code like icons for autocompletion
	'onsails/lspkind.nvim',
}
