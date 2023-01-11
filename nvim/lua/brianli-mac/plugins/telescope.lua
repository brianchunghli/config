if not vim.g.vscode then
    return {
        'nvim-telescope/telescope.nvim',
        version = '0.1.0',
        dependencies = 'nvim-lua/plenary.nvim',
        priority = 900,
        config = function()
            local status, _ = pcall(require, 'telescope')
            if status then
                local map = vim.keymap.set
                local telescope = require('telescope.builtin')
                map('n', '<leader>ff', telescope.find_files, { noremap = true })
                map('n', '<leader>fc', telescope.commands, { noremap = true })
                map('n', '<leader>fm', telescope.man_pages, { noremap = true })
                map('n', '<leader>fb', telescope.buffers, { noremap = true })
                map('n', '<leader>fh', telescope.help_tags, { noremap = true })
            end
        end
    }
end
