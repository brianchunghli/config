local config = {
    --   COLORSCHEMES
    { 'catppuccin/nvim',
        name = 'catppuccin',
        config = function()
            require('catppuccin').setup()
            vim.g.catppuccin_flavour = 'macchiato'
            local cmd = vim.cmd
            cmd 'colorscheme catppuccin'
        end,
        priority = 1000
    },
    { 'Mofiqul/dracula.nvim', name = 'dracula', lazy = 'VeryLazy' },
    { 'drewtempelmeyer/palenight.vim', name = 'pale', lazy = 'VeryLazy' },
    { 'rebelot/kanagawa.nvim', name = 'kanagawa', lazy = 'VeryLazy' },
    { 'bluz71/vim-nightfly-colors', name = 'nightfly', lazy = 'VeryLazy' },

    { 'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        priority = 550,
        config = function()
            require('todo-comments').setup()
        end
    },
    'lukas-reineke/indent-blankline.nvim',
    {
        'nvim-lua/popup.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },
    {
        'j-hui/fidget.nvim',
        priority = 800,
        config = function()
            require('fidget').setup()
        end
    },
    { 'ThePrimeagen/vim-be-good', lazy='VeryLazy' }
}
return config
