local lsp = require('mason-lspconfig')
lsp.setup {
    ensure_installed = {
        "sumneko_lua",
        "html",
        "pylsp",
        "sqlls",
        "grammarly",
    },
    automatic_installation = true,
}
