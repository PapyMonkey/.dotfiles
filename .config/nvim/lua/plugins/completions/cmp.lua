local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
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
	name = "cmp",
	"hrsh7th/nvim-cmp",

	lazy = true,
	event = { "InsertEnter" },

	dependencies = {
		"cmp-autopairs",
		"cmp-path",
		"cmp-cmdline",
		"cmp-nvim-lsp",
		"cmp-luasnip",
	},

	config = function()
		require("cmp").setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = {
				["<C-k>"] = require("cmp").mapping.select_prev_item(),
				["<C-j>"] = require("cmp").mapping.select_next_item(),
				["<C-b>"] = require("cmp").mapping(require("cmp").mapping.scroll_docs(-1), { "i", "c" }),
				["<C-f>"] = require("cmp").mapping(require("cmp").mapping.scroll_docs(1), { "i", "c" }),
				["<C-Space>"] = require("cmp").mapping(require("cmp").mapping.complete(), { "i", "c" }),
				["<C-y>"] = require("cmp").config.disable, -- Specify `require('cmp').config.disable` if you want to remove the default `<C-y>` mapping.
				["<C-e>"] = require("cmp").mapping({
					i = require("cmp").mapping.abort(),
					c = require("cmp").mapping.close(),
				}),
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = require("cmp").mapping.confirm({ select = true }),
				["<Tab>"] = require("cmp").mapping(function(fallback)
					if require("cmp").visible() then
						require("cmp").select_next_item()
					elseif require("luasnip").expandable() then
						require("luasnip").expand()
					elseif require("luasnip").expand_or_jumpable() then
						require("luasnip").expand_or_jump()
					elseif check_backspace() then
						fallback()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = require("cmp").mapping(function(fallback)
					if require("cmp").visible() then
						require("cmp").select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						require("luasnip").jump(-1)
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
				behavior = require("cmp").ConfirmBehavior.Replace,
				select = false,
			},
			--documentation = {
			--border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			--},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		})
	end,
}
