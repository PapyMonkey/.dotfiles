local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status_theme_ok, custom_ayu_dark = pcall(require, "lualine.themes.ayu_dark")
if not status_theme_ok then
	return
end

custom_ayu_dark.normal.c.bg = '#0d1117'

lualine.setup {
  options = {
    icons_enabled = true,
    theme = custom_ayu_dark,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
