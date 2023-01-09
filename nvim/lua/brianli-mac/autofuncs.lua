-- [[ vim functions ]]
local api = vim.api
local bufnr = api.nvim_get_current_buf()
local Makefile = api.nvim_create_augroup('makefile', { clear = true })
api.nvim_clear_autocmds({ buffer = bufnr, group = Makefile })
api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
    group = Makefile,
    desc = "Remove tab expansion during makefile editing",
    pattern = { "Makefile", "makefile" },
    callback = function()
        vim.bo.expandtab = false
    end
})

local changeshift = api.nvim_create_augroup('customshift', { clear = true })
api.nvim_clear_autocmds({ buffer = bufnr, group = changeshift })
api.nvim_create_autocmd("FileType", {
    desc = "custom tab expansion",
    pattern = { 'zsh', 'sh', 'c', 'html', 'cpp' },
    callback = function()
        -- change local buffer options
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
        vim.bo.tabstop = 2
    end,
    group = changeshift
})

-- Auto format write buffers
local format_sync_group = api.nvim_create_augroup('autoformat', { clear = true })
api.nvim_clear_autocmds({ buffer = bufnr, group = format_sync_group })
api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.py", "*.c", '*.rs', '*.cpp', '*.html', '*.css' },
    callback = function()
        vim.lsp.buf.format(nil, 200)
    end,
    group = format_sync_group,
})

local autoclose = api.nvim_create_augroup('autoclose', { clear = true })
api.nvim_clear_autocmds({ buffer = bufnr, group = autoclose })
local trouble_ok, _ = pcall(require, 'trouble')
if trouble_ok then
    api.nvim_create_autocmd({ "QuitPre", "ExitPre", "BufLeave" }, {
        callback = function()
            vim.cmd('TroubleClose')
        end,
        group = autoclose,
    })
end

local diagnosticshover = api.nvim_create_augroup('diagnosticshover', { clear = true })
api.nvim_clear_autocmds({ buffer = bufnr, group = diagnosticshover })
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
            -- prefix = '  ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end,
    group = diagnosticshover
})
