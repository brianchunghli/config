if not vim.g.vscode then
    return {
        'lewis6991/gitsigns.nvim',
        config = function()
            local status, gs = pcall(require, 'gitsigns')
            if status then
                gs.setup({
                    signs = {
                        add = { text = "+" },
                        change = { text = "~" },
                        delete = { text = "_" },
                        topdelete = { text = "‾" },
                        changedelete = { text = "~" },
                    },
                })
            end
        end
    }
end
