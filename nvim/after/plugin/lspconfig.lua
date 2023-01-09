local lspconfig = require("lspconfig")
local lsp_capabilities = lspconfig.util.default_config
lsp_capabilities.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_capabilities.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)
lsp_capabilities.update_in_insert = false
lsp_capabilities.flags = {
    debounce_text_changes = 150,
    allow_incremental_sync = true,
}
-- add language servers here
local servers = { 'pylsp', 'sqlls', 'html', 'grammarly', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
    if lsp == 'pylsp' then
        lspconfig[lsp].setup {
            capabilities = lsp_capabilities,
            settings = {
                pylsp = {
                    plugins = {
                        -- disable linters as we'll use ruff
                        pyflakes = { enabled = false },
                        pylint = { enabled = false },
                        pycodestyle = { enabled = false },
                        rope = { enabled = true },
                    }
                }
            }
        }
    elseif lsp == 'sumneko_lua' then
        lspconfig[lsp].setup {
            capabilities = lsp_capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim', } -- disable unused global message
                    }
                }
            }
        }
    else
        lspconfig[lsp].setup {
        capabilities = lsp_capabilities,
    }
    end
end
--lspconfig.pylsp.setup {
--    settings = {
--        pylsp = {
--            plugins = {
--                -- disable linters as we'll use ruff
--                pyflakes = { enabled = false },
--                pylint = { enabled = false },
--                pycodestyle = { enabled = false },
--                rope = { enabled = true },
--            }
--        }
--    }
--}
--lspconfig.sumneko_lua.setup {
--    settings = {
--        Lua = {
--            diagnostics = {
--                globals = { 'vim', } -- disable unused global message
--            }
--        }
--    }
--}
local clangd = require('clangd_extensions')
clangd.setup()
