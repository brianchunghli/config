-- lualine
if not vim.g.vscode then
    return {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        priority = 850,
        config = function()
            local status, ll = pcall(require, 'lualine')
            if status then
                local colors = {
                    blue   = '#82aaff',
                    purple = '#c792ea',
                    cyan   = '#7fdbca',
                    red    = '#ff5874',
                    yellow = '#e3d18a',
                    green  = '#98be65',
                    white  = '#d6deeb'
                }
                local options = {
                    icons_enabled = true,
                    theme = 'nightfly',
                    section_separators = { left = '', right = '' },
                    component_separators = "",
                }
                local ll_b = {
                    { "branch",
                        color = {
                            fg = colors.purple,
                        },
                    },
                    { "diff", colored = true, diff_color = {
                        added = { fg = colors.blue },
                        modified = { fg = colors.cyan },
                        removed = { fg = colors.red },
                    }
                    },
                }
                local ll_x = {
                    { "filetype",
                        icons_enabled = false,
                        right_padding = 2,
                        color = { fg = colors.white, },
                    },
                    { "encoding",
                        right_padding = 2,
                        color = { fg = colors.white },
                    },
                    { "fileformat",
                        right_padding = 2,
                        symbols = {
                            unix = 'UNIX',
                            dos = 'DOS',
                            mac = 'MAC',
                        },
                        color = { fg = colors.white, },
                    },
                }

                local ll_y = {
                    { "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = ' ', warn = ' ', info = ' ' },
                        diagnostics_colors = {
                            color_info = { fg = colors.blue },
                            color_warn = { fg = colors.cyan },
                            color_error = { fg = colors.red },
                        },
                        always_visible = true,
                        update_in_insert = true
                    }
                }
                ll.setup {
                    options = options,
                    sections = {
                        lualine_a = { "mode" },
                        lualine_b = ll_b,
                        lualine_c = {
                            { "filename",
                                symbols = {
                                    modified = '[+]',
                                    readonly = '[-]',
                                    unnamed = '[No Name]',
                                    newfile = '[New]',
                                },
                            },
                        },
                        lualine_x = ll_x,
                        lualine_y = ll_y,
                        lualine_z = {},
                    },
                }
            end
        end
    }
end
