local colors = {
    bg = "#000000",
    fg = "#999999",
    black = "#000000",
    red = "#997a7a",
    green = "#85997a",
    yellow = "#99997a",
    blue = "#7a8599",
    purple = "#997a99",
    cyan = "#7a9999",
    white = "#cccccc",
    lightgray = "#4d4d4d",
    darkgray = "#1a1a1a",
}

require('lualine').setup {
    options = {
        theme = {
            normal = {
                a = {bg = colors.lightgray, fg = colors.black, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.fg}
            },
            insert = {
                a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.fg}
            },
            visual = {
                a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.fg}
            },
            replace = {
                a = {bg = colors.red, fg = colors.black, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.fg}
            },
            command = {
                a = {bg = colors.green, fg = colors.black, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.bg}
            },
            inactive = {
                a = {bg = colors.bg, fg = colors.lightgray, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.lightgray},
                c = {bg = colors.bg, fg = colors.lightgray}
            }
        },
        section_separators = {'', ''},
        component_separators = {'', ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {{'diagnostics',
            sources = {'coc'},
            sections = {'error', 'warn'}
        }},
        lualine_c = {
            {'filename'},
            {'branch', icon = ""}
        },
        lualine_x = {'file_format', 'encoding'},
        lualine_y = {'filetype'},
        lualine_z = {'location'},
    }
}

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
