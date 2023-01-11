local ls = require("luasnip")
local cmp = require('cmp')
local lspkind = require('lspkind')
lspkind.init()
cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-h>'] = cmp.mapping.scroll_docs(-4),
        ['<C-l>'] = cmp.mapping.scroll_docs(4),
        ['<C-j>'] = cmp.mapping.select_prev_item(),
        ['<C-k>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif ls.expand_or_jumpable() then
                ls.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    formatting = {
        format = lspkind.cmp_format {
            default = true,
            kind = { "kind", "abbr", "menu" },
            menu = {
                luasnip = "[snip]",
                buffer = "[buf]",
                path = "[path]",
                nvim_lsp = "[lsp]",
            }
        }
    },
    experimental = {
        ghost_text = true,
    },
})
require("luasnip.loaders.from_vscode").lazy_load()
