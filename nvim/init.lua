-- init.lua

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
local cmd = vim.cmd
vim.g.mapleader = ' '
vim.g.localleader = '\\'

-- CHANGE DIAGNOSTIC SIGNS FOR WARNINGS
cmd "sign define DiagnosticSignError text=● texthl=DiagnosticSignError"
cmd "sign define DiagnosticSignWarn text=● texthl=DiagnosticSignWarn"
cmd "sign define DiagnosticSignInfo text=● texthl=DiagnosticSignInfo"
cmd "sign define DiagnosticSignHint text=● texthl=DiagnosticSignHint"

if not vim.g.vscode then
    require('brianli-mac')
end
