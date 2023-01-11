-- init.lua

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ' '
vim.g.localleader = '\\'

-- CHANGE DIAGNOSTIC SIGNS FOR WARNINGS
vim.cmd "sign define DiagnosticSignError text=● texthl=DiagnosticSignError"
vim.cmd "sign define DiagnosticSignWarn text=● texthl=DiagnosticSignWarn"
vim.cmd "sign define DiagnosticSignInfo text=● texthl=DiagnosticSignInfo"
vim.cmd "sign define DiagnosticSignHint text=● texthl=DiagnosticSignHint"

require('brianli-mac')
