if not vim.g.vscode then
    return {
        'williamboman/mason-lspconfig.nvim',
        priority = 900,
        config = function()
        local status, lsp = pcall(require, 'mason-lspconfig')
        if status then
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
        end
        end
    }
end
