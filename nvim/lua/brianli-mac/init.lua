-- init.lua

require('brianli-mac.opts') -- Options
require('brianli-mac.keymaps') -- Keymapping

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
local status, lazy = pcall(require, 'lazy')
if status then
    require('brianli-mac.autofuncs') -- functions and autocmds
    lazy.setup('brianli-mac.plugins') -- plugins
end
