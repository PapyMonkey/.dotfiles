local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("papy.lsp.lsp-installer")
require("papy.lsp.handlers").setup()
