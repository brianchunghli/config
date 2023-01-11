local ts = require('nvim-treesitter.configs')
ts.setup {
    ensure_installed = {
        "bash",
        "css",
        "html",
        "lua",
        "make",
        "cmake",
        "python",
        "c",
        "yaml",
        "regex",
        "javascript",
        "toml",
        "rust",
    },
    highlight = { enable = true },
    indent = { enable = true },
}
