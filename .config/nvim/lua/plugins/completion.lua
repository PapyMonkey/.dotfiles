--------------------------------------------------------------------------------
--     _         _                                  _      _       
--    / \  _   _| |_ ___   ___ ___  _ __ ___  _ __ | | ___| |_ ___ 
--   / _ \| | | | __/ _ \ / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \
--  / ___ \ |_| | || (_) | (_| (_) | | | | | | |_) | |  __/ ||  __/
-- /_/   \_\__,_|\__\___/ \___\___/|_| |_| |_| .__/|_|\___|\__\___|
--                                           |_|                   
--------------------------------------------------------------------------------
local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

--------------------------------------------------------------------------------

return {
	{
		'hrsh7th/nvim-cmp',
		lazy = true,
		event = {'InsertEnter'},
		dependencies = {
			'hrsh7th/cmp-path', -- path completions
			'hrsh7th/cmp-cmdline', -- cmdline completions
			'hrsh7th/cmp-nvim-lsp', -- for autocompletion
			{ -- snippet completions
				'saadparwaiz1/cmp_luasnip',
				dependencies = {
					'L3MON4D3/LuaSnip', --snippet engine
					'rafamadriz/friendly-snippets', -- a bunch of snippets to use
				},
			},
			{ -- Autopairs, integrates with both cmp and treesitter
				'windwp/nvim-autopairs',
				opts = {
					check_ts = true,
					ts_config = {
						lua = { "string", "source" },
						javascript = { "string", "template_string" },
						java = false,
					},
					disable_filetype = { "TelescopePrompt", "spectre_panel" },
					fast_wrap = {
						map = "<M-e>",
						chars = { "{", "[", "(", '"', "'" },
						pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
						offset = 0, -- Offset from pattern match
						end_key = "$",
						keys = "qwertyuiopzxcvbnmasdfghjkl",
						check_comma = true,
						highlight = "PmenuSel",
						highlight_grey = "LineNr",
					},
				},
			},
		},
		config = function()
			require('cmp').setup {
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = {
					["<C-k>"] = require('cmp').mapping.select_prev_item(),
					["<C-j>"] = require('cmp').mapping.select_next_item(),
					["<C-b>"] = require('cmp').mapping(require('cmp').mapping.scroll_docs(-1), { "i", "c" }),
					["<C-f>"] = require('cmp').mapping(require('cmp').mapping.scroll_docs(1), { "i", "c" }),
					["<C-Space>"] = require('cmp').mapping(require('cmp').mapping.complete(), { "i", "c" }),
					["<C-y>"] = require('cmp').config.disable, -- Specify `require('cmp').config.disable` if you want to remove the default `<C-y>` mapping.
					["<C-e>"] = require('cmp').mapping {
						i = require('cmp').mapping.abort(),
						c = require('cmp').mapping.close(),
					},
					-- Accept currently selected item. If none selected, `select` first item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = require('cmp').mapping.confirm { select = true },
					["<Tab>"] = require('cmp').mapping(function(fallback)
						if require('cmp').visible() then
							require('cmp').select_next_item()
						elseif require('luasnip').expandable() then
							require('luasnip').expand()
						elseif require('luasnip').expand_or_jumpable() then
							require('luasnip').expand_or_jump()
						elseif check_backspace() then
							fallback()
						else
							fallback()
						end
						end, {
							"i",
							"s",
					}),
					["<S-Tab>"] = require('cmp').mapping(function(fallback)
						if require('cmp').visible() then
							require('cmp').select_prev_item()
						elseif require('luasnip').jumpable(-1) then
							require('luasnip').jump(-1)
						else
							fallback()
						end
						end, {
							"i",
							"s",
					}),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
						-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
						vim_item.menu = ({
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				confirm_opts = {
					behavior = require('cmp').ConfirmBehavior.Replace,
					select = false,
				},
				--documentation = {
				--border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				--},
				experimental = {
					ghost_text = false,
					native_menu = false,
				},
			}
		end,
	},
}
