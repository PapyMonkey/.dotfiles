local Remap = require("papy.keymaps")
local nnoremap = Remap.nnoremap

local utils = require('telescope.utils')
local builtin = require('telescope.builtin')

_G.project_files = function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files(require('telescope.themes').get_dropdown({ previewer = false }))
    else
        builtin.find_files(require('telescope.themes').get_dropdown({ previewer = false }))
    end
end
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
nnoremap("<leader>f", '<cmd>lua project_files()<CR>')
-- nnoremap("<leader>F", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
nnoremap("<leader>g", ":Telescope live_grep<cr>")
nnoremap("<leader>G", ":Telescope grep_string<cr>")
nnoremap("<leader>b", ':Telescope buffers<CR>')
nnoremap("<leader>u", ":Telescope oldfiles<CR>")
nnoremap("<leader>d", ":Telescope lsp_definitions<CR>")
nnoremap("<leader>r", ":Telescope lsp_references<CR>")
nnoremap("<leader>i", ":Telescope lsp_implementations<CR>")

nnoremap("<C-p>", ":Telescope")
