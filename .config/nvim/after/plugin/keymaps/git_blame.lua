local Remap = require("papy.keymaps")
local nnoremap = Remap.nnoremap

local status_ok, _ = pcall(require, "gitblame")
if not status_ok then
    return
end

nnoremap("<leader>gB", ":GitBlameToggle<CR>");
nnoremap("<leader>go", ":GitBlameOpenCommitURL<CR>");
