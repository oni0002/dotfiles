require('lualine').setup({
  options = {
    theme = 'tokyonight',
    section_separators = {left = '', right = ''},
    component_separators = '',
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
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
  executions = {'nvim-tree'}
})
