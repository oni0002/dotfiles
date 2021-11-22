require('telescope').load_extension('coc')
require('telescope').setup({
  defaults = {
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'top',
    },
  },
})

-- Maps
require('nest').applyKeymaps({
    prefix = '<leader><leader>',
    {'f', '<cmd>Telescope find_files<cr>'},
    {'h', '<cmd>Telescope oldfiles<cr>'},
    {'b', '<cmd>Telescope buffers<cr>'},
    {'w', '<cmd>Telescope live_grep<cr>'},
    {';', '<cmd>Telescope commands<cr>'},
    {'l', '<cmd>Telescope current_buffer_fuzzy_find<cr>'},
    {'m', '<cmd>Telescope keymaps<cr>'},
    {'?', '<cmd>Telescope help_tags<cr>'},
    {'c;', '<cmd>Telescope coc commands<cr>'},
    {'d', '<cmd>Telescope coc diagnostics<cr>'},
    {'s', '<cmd>Telescope coc document_symbols<cr>'},
    {'a', '<cmd>Telescope coc code_actions<cr>'},
})
