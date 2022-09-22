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
nnoremap("<leader>u", ":Telescope oldfiles<CR>")
--[[ nnoremap("<leader>d", ":Telescope lsp_definitions<CR>") ]]
--[[ nnoremap("<leader>r", ":Telescope lsp_references<CR>") ]]
--[[ nnoremap("<leader>i", ":Telescope lsp_implementations<CR>") ]]

nnoremap("<C-p>", ":Telescope")

nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)

-- TODO: Fix this immediately
nnoremap("<leader>vwh", function()
    require('telescope.builtin').help_tags()
end)
