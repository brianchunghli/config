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
