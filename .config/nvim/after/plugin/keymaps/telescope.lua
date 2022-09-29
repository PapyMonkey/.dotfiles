local Remap = require("papy.keymaps")
local nnoremap = Remap.nnoremap

local utils = require('telescope.utils')
local builtin = require('telescope.builtin')

_G.project_files = function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

nnoremap("<C-p>", "<cmd>lua project_files()<CR>")
nnoremap("<leader>ps", builtin.live_grep)
nnoremap("<Leader>pf", builtin.find_files)
nnoremap("<leader>pw", builtin.grep_string)
nnoremap("<leader>pb", builtin.buffers)
nnoremap("<leader>po", builtin.oldfiles)
nnoremap("<leader>pt", builtin.treesitter)

nnoremap("<leader>pp", ":Telescope neoclip<CR>")

--[[ nnoremap("<leader>d", builtin.lsp_definitions) ]]
--[[ nnoremap("<leader>r", builtin.lsp_references) ]]
--[[ nnoremap("<leader>i", builtin.lsp_implementations) ]]

nnoremap("<leader>vh", builtin.help_tags)
nnoremap("<leader>vwh", builtin.help_tags) -- TODO: Fix this immediately

nnoremap("<leader>gb", builtin.git_branches)
