local Remap = require("papy.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Windows & tab management --
	-- Better window navigation
	nnoremap("<C-h>", "<C-w>h")
	nnoremap("<C-j>", "<C-w>j")
	nnoremap("<C-k>", "<C-w>k")
	nnoremap("<C-l>", "<C-w>l")

	-- Resize with arrows
	nnoremap("<C-Up>", ":resize +2<CR>")
	nnoremap("<C-Down>", ":resize -2<CR>")
	nnoremap("<C-Left>", ":vertical resize -2<CR>")
	nnoremap("<C-Right>", ":vertical resize +2<CR>")

	-- Manage windows
	nnoremap("<leader>v", ":vsplit<CR>")

	-- Manage buffers
	nnoremap("<leader>x", ":bw<CR>")

	-- Navigate buffers
	nnoremap("<S-l>", ":bnext<CR>")
	nnoremap("<S-h>", ":bprevious<CR>")

-- Text manipulation --
	-- Stay in indent mode
	vnoremap("<", "<gv")
	vnoremap(">", ">gv")

	-- Move text up and down
	vnoremap("<A-j>", ":m .+1<CR>==")
	vnoremap("<A-k>", ":m .-2<CR>==")
	vnoremap("p", '"_dP')

	-- Visual Block --
	-- Move text up and down
	xnoremap("J", ":move '>+1<CR>gv-gv")
	xnoremap("K", ":move '<-2<CR>gv-gv")
	xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
	xnoremap("<A-k>", ":move '<-2<CR>gv-gv")

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

vnoremap("<leader>d", "\"_d")

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

nnoremap("Q", "<nop>")
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
nnoremap("<leader>k", "<cmd>lnext<CR>zz")
nnoremap("<leader>j", "<cmd>lprev<CR>zz")

nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })
