local cb = require('nvim-tree.config').nvim_tree_callback

vim.g.nvim_tree_quit_on_open = 1
require('nvim-tree').setup({
  view = {
    mappings = {
      list = {
        {key={'<CR>', 'o', '<2-LeftMouse>'}, cb=cb('edit')},
        {key={'<2-RightMouse>', '<C-]>'}, cb=cb('cd')},
        {key='<C-v>', cb=cb('vsplit')},
        {key='<C-x>', cb=cb('split')},
        {key='<C-t>', cb=cb('tabnew')},
        {key='<BS>', cb=cb('close_node')},
        {key='R', cb=cb('refresh')},
        {key='a', cb=cb('create')},
        {key='d', cb=cb('remove')},
        {key='r', cb=cb('rename')},
        {key='y', cb=cb('copy')},
        {key='p', cb=cb('paste')},
        {key='Y', cb=cb('copy_path')},
        {key='-', cb=cb('dir_up')},
        {key='q', cb=cb('close')},
      }
    }
  }
})

-- Maps
require('nest').applyKeymaps({
    {'<c-e>', '<cmd>NvimTreeToggle<cr>'}
})
