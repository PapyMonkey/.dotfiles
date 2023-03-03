local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    return
end

mason.setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

mason_lspconfig.setup {
    ensure_installed = {
        "arduino_language_server",
        "clangd",
        "cmake",
        "cssls",
        "html",
        "jsonls",
        "ltex",
        "marksman",
        "pyright",
        "lua_ls",
        "vimls"
    }
}
