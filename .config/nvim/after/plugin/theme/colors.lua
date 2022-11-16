--[[ local colorscheme = "ghdark" ]]
local colorscheme = "solarized"

local status_ok, solarized = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
