local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local Remap = require("papy.keymaps")
local nnoremap = Remap.nnoremap

local utils = require('telescope.utils')
local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions

_G.project_files = function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

_G.find_dotfiles = function()
    local i, dotfiles_array = 0, {}
    local dotfiles_ls = io.popen("cd ~ && /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files")
    for filename in dotfiles_ls:lines() do
        i = i + 1
        dotfiles_array[i] = filename
        print(filename)
    end
    dotfiles_ls:close()

    builtin.find_files {
        search_dirs=dotfiles_array
    }
end

nnoremap("<leader>pf", project_files)
nnoremap("<leader>pF", builtin.find_files)
nnoremap("<leader>pd", find_dotfiles)
nnoremap("<leader>pe", extensions.file_browser.file_browser)
nnoremap("<leader>ps", builtin.live_grep)
nnoremap("<leader>pw", builtin.grep_string)
nnoremap("<leader>pb", builtin.buffers)
nnoremap("<leader>po", builtin.oldfiles)
nnoremap("<leader>pt", builtin.treesitter)
nnoremap("<leader>pr", builtin.resume)
nnoremap("<leader>pa", builtin.pickers)

-- Buffers

nnoremap("<leader>pp", ":Telescope neoclip<CR>")

--[[ nnoremap("<leader>d", builtin.lsp_definitions) ]]
--[[ nnoremap("<leader>r", builtin.lsp_references) ]]
--[[ nnoremap("<leader>i", builtin.lsp_implementations) ]]

nnoremap("<leader>vh", builtin.help_tags)
nnoremap("<leader>vwh", builtin.help_tags) -- TODO: Fix this immediately

nnoremap("<leader>gb", builtin.git_branches)
