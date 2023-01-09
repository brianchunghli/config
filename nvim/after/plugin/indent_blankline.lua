local status, bl = pcall(require, 'indent_blankline')
-- require('indent_blankline')
if not status then
    vim.notify('Unable to load indent blankline', 'error')
else
    bl.setup {
        filetype_exclude = {
            "dashboard",
            "help",
            "man",
        },
        use_treesitter = true,
    }
end
