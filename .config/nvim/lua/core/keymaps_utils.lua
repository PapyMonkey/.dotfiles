local Keybinds = {}

local function bind(mode, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

--	Modes :
-- 		normal_mode = "n",
--		insert_mode = "i",
--		visual_mode = "v",
--		visual_block_mode = "x",
--		term_mode = "t",
--		command_mode = "c",

Keybinds.nmap = bind("n", {noremap = false})
Keybinds.nnoremap = bind("n")
Keybinds.vnoremap = bind("v")
Keybinds.xnoremap = bind("x")
Keybinds.inoremap = bind("i")

return Keybinds
