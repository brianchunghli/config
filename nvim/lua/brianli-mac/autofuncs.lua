-- vim autocommands

local api = vim.api
local bufnr = api.nvim_get_current_buf()
local Makefile = api.nvim_create_augroup('makefile', { clear = true })
api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
    group = Makefile,
    desc = "Remove tab expansion during makefile editing",
    pattern = { "Makefile", "makefile" },
    callback = function()
        vim.bo.expandtab = false
    end
})

-- use 2 spaced tabs for the specified files
local changeshift = api.nvim_create_augroup('customshift', { clear = true })
api.nvim_create_autocmd("FileType", {
    desc = "custom tab expansion",
    pattern = { 'zsh', 'sh', 'c', 'html', 'cpp' },
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
        vim.bo.tabstop = 2
    end,
    group = changeshift
})

-- Auto format specified buffers on write
local format_sync_group = api.nvim_create_augroup('autoformat', { clear = true })
api.nvim_create_autocmd("BufWritePre", {
    -- removed lua and html formatting
    pattern = { "*.py", "*.c", '*.rs', '*.cpp', '*.css' },
    callback = function()
        vim.lsp.buf.format(nil, 200)
    end,
    group = format_sync_group,
})

-- display diagnostics as hovers
local diagnosticshover = api.nvim_create_augroup('diagnosticshover', { clear = true })
api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            style = 'minimal',
            border = 'single',
            source = 'always',
            max_width = 100,
            title = 'test',
            pad_top = 0.1,
            pad_bottom = 0.2,
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end,
    group = diagnosticshover
})
