local Remap = require("papy.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Windows & tab management --
	-- Resize with arrows
	nnoremap("<C-Up>", ":resize +2<CR>")
	nnoremap("<C-Down>", ":resize -2<CR>")
	nnoremap("<C-Left>", ":vertical resize -2<CR>")
	nnoremap("<C-Right>", ":vertical resize +2<CR>")

	-- Split windows
	nnoremap("<leader>sv", "<C-w>v") -- split windows vertically
	nnoremap("<leader>sh", "<C-w>s") -- split windows horizontally
	nnoremap("<leader>se", "<C-w>=") -- make split windows equal width
	nnoremap("<leader>sx", ":close<CR>") -- close current splitd window

	-- Manage buffers
    nnoremap("<leader>bx", ":Bw<CR>")
	--[[ nnoremap("<leader>x", ":bp | sp | bn | bd<CR>") ]]

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

-- Plugin keymaps

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

inoremap("<C-c>", "<Esc>") -- This is going to get me cancelled. -Prime

nnoremap("Q", "<nop>")
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--[[ nnoremap("<C-k>", "<cmd>cnext<CR>zz") ]]
--[[ nnoremap("<C-j>", "<cmd>cprev<CR>zz") ]]
--[[ nnoremap("<leader>k", "<cmd>lnext<CR>zz") ]]
--[[ nnoremap("<leader>j", "<cmd>lprev<CR>zz") ]]

nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })
