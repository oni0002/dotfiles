local nest = require('nest')

-- general mappings
nest.applyKeymaps({
    {mode = 'n', {
        {'<c-', {
            -- save
            {'s>', '<cmd>update<cr>'},
            -- close
            {'q>', '<cmd>q<cr>'},
            -- close buffer
            -- {'x>', '<cmd>bd<cr>'},
            -- new tab, split, vsplit
            {'w>', {
                {'t', '<cmd>tabnew<cr>'},
                {'s', '<cmd>sp<cr>'},
                {'v', '<cmd>vs<cr>'},
            }},
            -- switch window
            {'h>', '<c-w>h'},
            {'j>', '<c-w>j'},
            {'k>', '<c-w>k'},
            {'l>', '<c-w>l'},
        }},
        -- make Y more natural
        {'Y', 'y$'},
        -- enter C
        {';', ':', options = {silent = false}},
        {':', ';'},
        -- clear hl
        {'<esc>', '<cmd>noh<cr><esc>'},
        -- redo
        {'U', '<c-r>'},
        -- fold/unfold
        {'<leader>z', 'za'},
        -- next/prev buffer
        {']b', '<cmd>bn<cr>'},
        {'[b', '<cmd>bp<cr>'},
        -- next/prev tab
        {']t', '<cmd>tabn<cr>'},
        {'[t', '<cmd>tabp<cr>'},
    }},

    {mode = 'i', {
        {'<c-', {
            -- save
            {'s>','<c-o><cmd>update<cr>'},
            -- close
            {'q>','<esc><cmd>q<cr>'},
        }},
        {'jk', '<esc>'},
    }},

    {mode = '!', {
        {'<c-', {
            -- forward/back in I, C
            {'f>', '<right>'},
            {'b>', '<left>'},
            -- head/end in I, C
            {'a>', '<home>'},
            {'e>', '<end>'},
        }},
    }},

    {mode = '', {
        -- indent
        {'<tab>', '>gv'},
        {'<s-tab>', '<gv'},
        -- make j, k more natural
        {'j', 'gj'},
        {'k', 'gk'},
        -- head/end
        {'H', '^'},
        {'L', '$'},
    }},

    -- exit C
    {mode = 'c', {'jk', '<esc>'}},
    -- exit T
    {mode = 't', {'<esc>', '<c-\\><c-n>'}},
})

-- plugins

-- lsp
nest.applyKeymaps({
    {'gd', '<cmd>lua vim.lsp.buf.definition()<cr>'},
    {'K', '<cmd>lua vim.lsp.buf.hover()<cr>'},
    {'<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>'},
    {'gr', '<cmd>lua vim.lsp.buf.reference()<cr>'},
    {'<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>'},
    {'<leader>xx', '<cmd>TroubleToggle<cr>'},
    {'<leader>f', '<cmd>Format<cr>'},
})

-- telescope
nest.applyKeymaps({
    prefix = '<leader><leader>',
    {'f', '<cmd>Telescope find_files<cr>'},
    {'h', '<cmd>Telescope oldfiles<cr>'},
    {'b', '<cmd>Telescope buffers<cr>'},
    {';', '<cmd>Telescope commands<cr>'},
    {'m', '<cmd>Telescope keymaps<cr>'},
    {'l', '<cmd>Telescope current_buffer_fuzzy_find<cr>'},
})

-- nvimtree
nest.applyKeymaps({
    {'<c-e>', '<cmd>NvimTreeToggle<cr>'}
})

-- kommentary
nest.applyKeymaps({
    options = {noremap = false},
    {mode = 'n', {'<leader>c', '<Plug>kommentary_line_default'}},
    {mode = 'x', {'<leader>c', '<Plug>kommentary_visual_default'}},
})

