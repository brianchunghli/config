-- [[ BASIC ]]
require('impatient')
require('catppuccin').setup()
-- neovim is used via the VSCode neovim
-- extension

local function run_package(package)
    local status, run = pcall(require, package)
    if not status then
        local status2, _ = pcall(require, "notify")
        if not status2 then
            print('Unable to run ' .. package)
        else
            vim.notify(
                "Unable to run or install " .. package,
                'Error',
                {
                    title = 'Package load error: ' .. package
                })
        end
    else
        return run
    end
end

if not vim.g.vscode then
    local notify = run_package('notify')
    if notify then
        notify.setup()
        vim.notify = notify
    end

    local telescope = run_package('telescope')
    if telescope then
        telescope.setup()
    end

    local nt = run_package('nvim-tree')
    if nt then
        nt.setup()
    end

    local mason = run_package('mason')
    if mason then
        mason.setup()
    end

    local null_ls = run_package('null-ls')
    if null_ls then
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local sources = {
            --  FORMATTING
            formatting.reorder_python_imports,
            formatting.usort,
            formatting.beautysh,
            formatting.ruff,
            formatting.prettierd,
            --  ERROR CHECKING
            diagnostics.mypy.with({
                method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            }),
            -- manually installed via mason
            diagnostics.ruff,
        }
        null_ls.setup({
            sources = sources,
            diagnostics_format = "[#{c}] #{m} (#{s})"
        })
    end

    --  AUTO COMPLETION
    local ts = run_package('nvim-treesitter.configs')
    if ts then
        ts.setup {
            ensure_installed = {
                "bash",
                "css",
                "html",
                "lua",
                "make",
                "cmake",
                "python",
                "c",
                "yaml",
                "regex",
                "javascript",
                "toml",
                "rust",
            },
            highlight = { enable = true },
            ident = { enable = true },
        }
    end

    -- tabline
    local bufferline = run_package('bufferline')
    if bufferline then
        bufferline.setup({
            options = {
                separator_style = 'slant'
            }
        })
    end
    require("luasnip.loaders.from_vscode").lazy_load()
end
