--[[ vars.lua ]]
local opt = vim.o                       -- setting vim options with lua               
-- [[ vimscript commands ]]  
vim.g.catppuccin_flavour = 'macchiato'  -- str: setting the sub-colorscheme
vim.cmd "colorscheme catppuccin"        -- str: setting the colorscheme 
vim.g.highlights_insert_mode_enabled =  false

-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.opt.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

-- Show diagnostic popup on cursor hover
vim.opt.updatetime = 250

-- tree sitter folding
vim.wo.foldmethod = 'syntax'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- [[ Context ]]
opt.number = true                       -- bool: Show line numbers
opt.relativenumber = true               -- bool: Show relative line numbers
opt.signcolumn = "yes"                  -- str:  Show the sign column
opt.laststatus = 2                      -- int: Always show status line
-- opt.colorcolumn = '100'              -- str:  Show col for max line length
-- opt.scrolloff = 4                    -- int:  Min num lines of context

-- [[ Filetypes ]]
opt.encoding = 'utf8'                   -- str:  String encoding to use
opt.fileencoding = 'utf8'               -- str:  File encoding to use
opt.filetype = true                     -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"                       -- str:  Allow syntax highlighting
opt.termguicolors = true                -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true                   -- bool: Ignore case in search patterns
opt.smartcase = true                    -- bool: Override ignorecase if search contains capitals
opt.incsearch = true                    -- bool: Use incremental search
opt.hlsearch = true                     -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true                    -- bool: Use spaces instead of tabs
opt.shiftwidth = 4                      -- num:  Size of an indent
opt.softtabstop = 4                     -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                         -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true                   -- bool: Place new window to right of current one
opt.splitbelow = true                   -- bool: Place new window below the current one

-- [[ lsp diagnostics ]]
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
