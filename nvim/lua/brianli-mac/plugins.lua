-- [[ CONTAINS ALL PLUGINS ]]
-- /users/brianli/.config/nvim
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
local config = {
    -- IMPORTANT
    'lewis6991/gitsigns.nvim',
    --   COLORSCHEMES
    { 'catppuccin/nvim',
        name = 'catppuccin',
        config = function()
            require('catppuccin').setup()
            vim.g.catppuccin_flavour = 'macchiato'
            vim.cmd('colorscheme catppuccin')
        end,
        priority = 900
    },
    { 'Mofiqul/dracula.nvim', name = 'dracula' },
    { 'drewtempelmeyer/palenight.vim', name = 'pale' },
    { 'rebelot/kanagawa.nvim', name = 'kanagawa' },
    { 'bluz71/vim-nightfly-colors', name = 'nightfly' },
}
if not vim.g.vscode then
    function TableConcat(t1, t2)
        for i = 1, #t2 do
            t1[#t1 + 1] = t2[i]
        end
        return t1
    end

    config = TableConcat(config, {
        { 'goolord/alpha-nvim',
            config = function()
                require 'alpha'.setup(require 'alpha.themes.startify'.config)
            end
        },
        -- FILES
        { 'nvim-telescope/telescope.nvim',
            version = '0.1.0',
            dependencies = 'nvim-lua/plenary.nvim',
        },
        { 'kyazdani42/nvim-tree.lua',
            dependencies = 'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-tree').setup()
            end
        },
        { 'ThePrimeagen/vim-be-good' },
        --  LSP && AUTOCOMPLETION
        -- set up rust analyser with extra features

        { 'neovim/nvim-lspconfig' },
        { 'jose-elias-alvarez/null-ls.nvim' },
        -- currently broken
        -- use { 'simrat39/rust-tools.nvim' }
        -- using a fix fork of rust-tools
        { 'kdarkhan/rust-tools.nvim' },
        { 'p00f/clangd_extensions.nvim' },
        { 'williamboman/mason.nvim',
            config = function()
                require('mason').setup()
            end
        },
        -- integrates mason and lsp
        { 'williamboman/mason-lspconfig.nvim' },
        { 'nvim-treesitter/nvim-treesitter',
            priority = 1000,
        },
        { 'akinsho/bufferline.nvim', version = 'v3.*',
            dependencies = 'kyazdani42/nvim-web-devicons',
        },
        { 'nvim-lualine/lualine.nvim',
            dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
        },
        { 'rcarriga/nvim-notify' },
        { 'j-hui/fidget.nvim', },
        { 'folke/trouble.nvim',
            dependencies = 'kyazdani42/nvim-web-devicons',
        },
        { 'folke/todo-comments.nvim',
            dependencies = 'nvim-lua/plenary.nvim',
        },
        -- provides hover definition functionality
        { 'lewis6991/hover.nvim', },
        -- [[ snipper]]
        { 'L3MON4D3/LuaSnip' },
        { 'hrsh7th/nvim-cmp',
            dependencies = {
                -- LSP
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-nvim-lua',
                'amarakon/nvim-cmp-buffer-lines',
                'rafamadriz/friendly-snippets',
                -- ICONS
                'onsails/lspkind-nvim',
            }
        },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'nvim-lua/popup.nvim' },
        { 'lukas-reineke/indent-blankline.nvim', }
    })
end
require('lazy').setup(config)
