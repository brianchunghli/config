local status, _ = pcall(require, 'null-ls')
if status then
    local null_ls = require('null-ls')
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
