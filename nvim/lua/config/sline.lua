require('tabline').setup({
    enable = false,
    options = {
        section_separators = {'', ''},
        component_separators = {'', ''},
    }
})

require('lualine').setup({
    options = {
        theme = 'tokyonight',
        section_separators = {left = '', right = ''},
        component_separators = {'', ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {'branch', icon = ""},
        },
        lualine_c = {
            {'filename'},
            {'diagnostics', sources = {'coc'}, sections = {'error', 'warn'}}
        },
        lualine_x = {'file_format', 'encoding', 'filetype', 'location'},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { require('tabline').tabline_buffers },
        lualine_x = { require('tabline').tabline_tabs },
        lualine_y = {},
        lualine_z = {},
    },
})
