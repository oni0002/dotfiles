vim.g.kommentary_create_default_mappings = false

require('kommentary.config').configure_language('default', {
  prefer_single_line_comments = true,
})
require('kommentary.config').configure_language('python', {
  single_line_comment_string = '#',
})

-- Maps
require('nest').applyKeymaps({
  options = {noremap = false},
  {mode = 'n', {'<leader>c', '<Plug>kommentary_line_default'}},
  {mode = 'x', {'<leader>c', '<Plug>kommentary_visual_default'}},
})
