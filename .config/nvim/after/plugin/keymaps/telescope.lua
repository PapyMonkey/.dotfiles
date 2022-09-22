local Remap = require("papy.keymaps")
local nnoremap = Remap.nnoremap

local builtin = require('telescope.builtin')

nnoremap("<C-p>", builtin.git_files)
nnoremap("<leader>ps", builtin.live_grep)
nnoremap("<Leader>pf", builtin.find_files)
nnoremap("<leader>pw", builtin.grep_string)
nnoremap("<leader>pb", builtin.buffers)
nnoremap("<leader>po", builtin.oldfiles)
nnoremap("<leader>pt", builtin.treesitter)

--[[ nnoremap("<leader>d", builtin.lsp_definitions) ]]
--[[ nnoremap("<leader>r", builtin.lsp_references) ]]
--[[ nnoremap("<leader>i", builtin.lsp_implementations) ]]

nnoremap("<leader>vh", builtin.help_tags)
nnoremap("<leader>vwh", builtin.help_tags) -- TODO: Fix this immediately
