local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
    return
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
    return
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
    vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
    vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    vim.keymap.set("n", "<leader>o", ":LSoutlineToggle<CR>", opts) -- see outline on right hand side
end

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure bash server
lspconfig["bashls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- configure c server
lspconfig["clangd"].setup {
    capabilities = capabilities,
    single_file_support = true,
    on_attach = on_attach,
}

-- configure cmake server
lspconfig["cmake"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- configure css server
lspconfig["cssls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- configure html server
lspconfig["html"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- configure json server
lspconfig["jsonls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- configure marksman server
lspconfig["marksman"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- configure pyright server
lspconfig["pyright"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})
