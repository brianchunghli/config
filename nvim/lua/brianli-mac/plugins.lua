-- [[ CONTAINS ALL PLUGINS ]]
local fn = vim.fn
-- /users/brianli/.config/nvim
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
else
    vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end]])
    return require("packer").startup(function(use)

        -- IMPORTANT
        use { "wbthomason/packer.nvim" }
        use { "lewis6991/gitsigns.nvim" }
        --   COLORSCHEMES 
        use { "catppuccin/nvim", as = "catppuccin" }
        use { "Mofiqul/dracula.nvim", as = "dracula" }
        use { "drewtempelmeyer/palenight.vim", as = "pale" }
        use { "rebelot/kanagawa.nvim", as = "kanagawa" }
        use { 'bluz71/vim-nightfly-colors', as = "nightfly" }

        if not vim.g.vscode then
            use { "lewis6991/impatient.nvim" }
            --  DASHBOARD
            use { "glepnir/dashboard-nvim" }
            -- FILES
            use { "nvim-telescope/telescope.nvim",
                tag = "0.1.0",
                requires = "nvim-lua/plenary.nvim",
            }
            use { "kyazdani42/nvim-tree.lua",
                requires = "kyazdani42/nvim-web-devicons"
            }
            use { 'ThePrimeagen/vim-be-good' }
            --  LSP && AUTOCOMPLETION
            -- set up rust analyser with extra features
            use { "neovim/nvim-lspconfig" }
            use { "jose-elias-alvarez/null-ls.nvim" }
            -- currently broken
            -- use { "simrat39/rust-tools.nvim" }
            -- using a fix fork of rust-tools
            use { "kdarkhan/rust-tools.nvim" }
            use { "p00f/clangd_extensions.nvim" }
            use { "williamboman/mason.nvim" }
            -- integrates mason and lsp
            use { "williamboman/mason-lspconfig.nvim" }
            use("nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' })
            use { 'akinsho/bufferline.nvim', tag = "v3.*",
                requires = 'nvim-tree/nvim-web-devicons'
            }
            use { "nvim-lualine/lualine.nvim",
                requires = { "kyazdani42/nvim-web-devicons",
                    opt = true }
            }
            use { "rcarriga/nvim-notify" }
            use {
                "j-hui/fidget.nvim",
                config = function()
                    require("fidget").setup()
                end
            }
            use {
                "folke/trouble.nvim",
                requires = "kyazdani42/nvim-web-devicons",
            }
            use {
                "folke/todo-comments.nvim",
                requires = "nvim-lua/plenary.nvim",
                config = function()
                    require("todo-comments").setup()
                end,
            }
            -- provides hover definition functionality
            use {
                "lewis6991/hover.nvim",
                config = function()
                    require("hover").setup {
                        init = function()
                            -- Require providers
                            require("hover.providers.lsp")
                            -- require('hover.providers.gh')
                            -- require('hover.providers.gh_user')
                            -- require('hover.providers.jira')
                            -- require('hover.providers.man')
                            -- require('hover.providers.dictionary')
                        end,
                        preview_opts = {
                            border = nil
                        },
                        -- Whether the contents of a currently open hover window should be moved
                        -- to a :h preview-window when pressing the hover keymap.
                        preview_window = false,
                        title = true
                    }

                    -- Setup keymaps
                    vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
                    vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
                end
            }
            use { "xorid/asciitree.nvim" }
            -- [[ snipper]]
            use { "L3MON4D3/LuaSnip" }
            use { "hrsh7th/nvim-cmp",
                requires = {
                    -- LSP
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-nvim-lua",
                    "amarakon/nvim-cmp-buffer-lines",
                    "rafamadriz/friendly-snippets",
                    -- ICONS
                    "onsails/lspkind-nvim",
                }
            }
            use { 'saadparwaiz1/cmp_luasnip' }
            use { 'nvim-lua/popup.nvim' }
            use { "lukas-reineke/indent-blankline.nvim", }
        end
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if Packer_bootstrap then
            require('packer').sync()
        end
    end)
end
