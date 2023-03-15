local options = {
	--[[ guicursor = "",								-- set cursor ]]

	number = true,                              -- set numbered lines
	relativenumber = true,						-- set relative numbered lines

	errorbells = false,							-- disable terminal bell

	backup = false,								-- creates a backup file
	swapfile = false,                           -- creates a swapfile
	undofile = true,                            -- enable persistent undo
	writebackup = false,						-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

	hlsearch = true,							-- highlight all matches on previous search pattern
	ignorecase = true,							-- ignore case in search patterns
	smartcase = true,							-- smart case in search patterns

	termguicolors = true,						-- set term gui colors (most terminals support this)

	tabstop = 4,								-- insert 4 spaces for a tab
	softtabstop = 4,							-- insert 4 spaces for a softtab
	shiftwidth = 4,								-- the number of spaces inserted for each indentation
	expandtab = false,							-- convert tabs to spaces

	showtabline = 0,                            -- show tabs line

	smartindent = true,                         -- make indenting smarter adgain

	wrap = false,                               -- display lines as one long line

	clipboard = "unnamedplus",					-- allows neovim to access the system clipboard

	colorcolumn = "80",							-- show horizontal limit
	scrolloff = 8,                              -- is one of my fav
	sidescrolloff = 8,
	numberwidth = 4,                            -- set number column width to 2 {default 4}
	signcolumn = "yes",                         -- always show the sign column, otherwise it would shift the text each time

	cmdheight = 2,								-- more space in the neovim command line for displaying messages

	updatetime = 50,                          	-- faster completion (4000ms default)

	completeopt = { "menuone", "noselect" }, 	-- mostly just for cmp
	conceallevel = 0,                           -- so that `` is visible in markdown files
	fileencoding = "utf-8",						-- the encoding written to a file
	mouse = "a",								-- allow the mouse to be used in neovim
	pumheight = 10,								-- pop up menu height
	showmode = false,                           -- we don't need to see things like -- INSERT -- anymore
	splitbelow = true,                          -- force all horizontal splits to go below current window
	splitright = true,                          -- force all vertical splits to go to the right of current window
	timeoutlen = 1000,                          -- time to wait for a mapped sequence to complete (in milliseconds)
	cursorline = true,                         -- highlight the current line
	guifont = "monospace:h17",					-- the font used in graphical neovim applications
	background = "dark",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
