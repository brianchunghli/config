if not vim.g.vscode then
    -- plugin
    return {
        'nvim-treesitter/nvim-treesitter',
        config = function() 
            require('nvim-treesitter.configs').setup(
            {
                ensure_installed = {
                "bash",
                "css",
                "html",
                "make",
                "cmake",
                "python",
                "cpp",
                "yaml",
                "regex",
                "javascript",
                "toml",
                "rust",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
        end
    }
end
