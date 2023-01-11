if not vim.g.vscode then
    return {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'kdarkhan/rust-tools.nvim', -- currently in use as original repo is broken
                                        -- use { 'simrat39/rust-tools.nvim' }
            'p00f/clangd_extensions.nvim',
        },
        config = function()
            local status, lspconfig = pcall(require, 'lspconfig')
            if status then
                local lsp_capabilities = lspconfig.util.default_config
                lsp_capabilities.capabilities = vim.tbl_deep_extend(
                    'force',
                    lsp_capabilities.capabilities,
                    require('cmp_nvim_lsp').default_capabilities())
                lsp_capabilities.update_in_insert = false
                lsp_capabilities.flags = {
                    debounce_text_changes = 150,
                    allow_incremental_sync = true,
                }
                local opts = { noremap = true, silent = true }
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                local on_attach = function(_, bufnr)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                    -- Mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local bufopts = { noremap = true, silent = true, buffer = bufnr }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, bufopts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
                end

                local py_settings = {
                    pylsp = {
                        plugins = {
                            pyflakes = { enabled = false },
                            pylint = { enabled = false },
                            pycodestyle = { enabled = false },
                            rope = { enabled = true },
                        }
                    }
                }
                local lua_settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim', } -- disable unused global message
                        }
                    }
                }
                lspconfig['pylsp'].setup({
                    on_attach = on_attach,
                    capabilities = lsp_capabilities,
                    settings = py_settings
                })
                lspconfig['sumneko_lua'].setup({
                    on_attach = on_attach,
                    capabilities = lsp_capabilities,
                    settings = lua_settings
                })
                -- generic settings
                local servers = { 'sqlls', 'html', 'grammarly', }
                for _, lsp in ipairs(servers) do
                    lspconfig[lsp].setup({
                        on_attach = on_attach,
                        capabilities = lsp_capabilities,
                    })
                end

                -- enhanced capabilities for c and rust
                local _, clangd = pcall(require, 'clangd_extensions')
                clangd.setup({
                    server = { on_attach = on_attach }
                })
                local _, rs = pcall(require, 'rust-tools')
                rs.setup({
                    server = { on_attach = on_attach },
                    inlay_hints = { only_current_line = true },
                })
            end
        end
    }
end
