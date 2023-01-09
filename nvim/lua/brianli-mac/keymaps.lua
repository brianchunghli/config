--[[ keys.lua ]]
--This function takes in four parameters:
local map = vim.keymap.set
-- vim.g = let
-- vim.o = set
--   mode: the mode you want the key bind to apply to (e.g., insert mode, normal mode, command mode, visual mode).
--    sequence: the sequence of keys to press.
--    command: the command you want the keypresses to execute.
--    options: an optional Lua table of options to configure (e.g., silent or noremap).

-- [[ telescope hotkeys ]]
local telescope, _ = pcall(require, 'telescope')
if telescope then
    local builtin = require('telescope.builtin')
    map('n', '<leader>ff', builtin.find_files, { noremap = true })
    map('n', '<leader>fc', builtin.commands, { noremap = true })
    map('n', '<leader>fm', builtin.man_pages, { noremap = true })
    map('n', '<leader>fb', builtin.buffers, { noremap = true })
    map('n', '<leader>fh', builtin.help_tags, { noremap = true })
end

-- [[ Packages ]]
local packer, _ = pcall(require, 'packer')
if packer then
    map("n", "<Leader>ps", ":PackerStatus<CR>", { noremap = true })
    map("n", "<Leader>pss", ":PackerSync<CR>", { noremap = true })
    map("n", "<Leader>m", ":Mason<CR>", { noremap = true })
    map("n", "<Leader>tt", ":NvimTreeToggle<CR>", { silent = true })
    map("n", "<Leader>tr", ":NvimTreeRefresh<CR>", { silent = true })
    map("n", "<Leader>\\", ":ToggleTerm<CR>", { silent = true })
    map("n", "<Leader>t", ":TroubleToggle<CR>", { noremap = true })
end

-- Buffer navigation
map("n", "<Leader>h", ":bn<CR>", { noremap = true }) -- move to right buffer
map("n", "<Leader>l", ":bp<CR>", { noremap = true }) -- move to left buffer
map("n", "<Leader>q", ":bd<CR>", { noremap = true }) -- remove current buffer
map("n", "<Leader>ch", ":nohl<CR>", { noremap = true }) -- clear highlights

-- vim key remappings
map("n", "<leader>w", ":w<CR>", { noremap = true }) -- write file
map("v", "<leader>ii", ":norm i", { noremap = true }) -- insert

-- format file
map("n", "<leader>fa", ":lua vim.lsp.buf.format{async=true}<CR>", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true }) -- half page scroll up
map("n", "<C-d>", "<C-d>zz", { noremap = true }) -- half page scroll down
map("v", "<leader>rc", ":s/", { noremap = true }) -- find and replace
map("n", "<leader>y", "\"+y", { noremap = true }) -- yank into clipboard normal mode
map("v", "<leader>y", "\"+y", { noremap = true }) -- yank into clipboard visual mode
map("n", "<leader>y", "\"+y", { noremap = true }) -- yank into universal clipboard
