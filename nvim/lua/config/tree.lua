local g = vim.g
local tree_cb = require('nvim-tree.config').nvim_tree_callback
local nest = require('nest')

require('nvim-tree').setup()
g.nvim_tree_quit_on_open = 1

g.nvim_tree_bindings = {
  { key = { '<CR>', 'o', '<2-LeftMouse>' }, cb = tree_cb('edit') },
  { key = { '<2-RightMouse>', '<C-]>' }, cb = tree_cb('cd') },
  { key = '<C-v>', cb = tree_cb('vsplit') },
  { key = '<C-x>', cb = tree_cb('split') },
  { key = '<C-t>', cb = tree_cb('tabnew') },
  { key = '<BS>', cb = tree_cb('close_node') },
  { key = 'R', cb = tree_cb('refresh') },
  { key = 'a', cb = tree_cb('create') },
  { key = 'd', cb = tree_cb('remove') },
  { key = 'r', cb = tree_cb('rename') },
  { key = 'y', cb = tree_cb('copy') },
  { key = 'p', cb = tree_cb('paste') },
  { key = 'Y', cb = tree_cb('copy_path') },
  { key = '-', cb = tree_cb('dir_up') },
  { key = 'q', cb = tree_cb('close') },
}

-- maps
nest.applyKeymaps({
    {'<c-e>', '<cmd>NvimTreeToggle<cr>'}
})
