-- init.lua

-- require('opts') {{{
local g = vim.g
local o = vim.o

-- python provider
if vim.env.VIRTUAL_ENV then
  g.python3_host_prog = vim.env.VIRTUAL_ENV .. '/bin/python'
end
g.loaded_python_provider = 0

-- leader key
g.mapleader = ' '
g.maplocalleader = ','

o.termguicolors = true
o.clipboard = 'unnamedplus' -- use system clipboard
o.mouse = 'a' -- enable using mouse
o.splitright = true -- split to right
o.splitbelow = true -- split to below
o.backup = false -- don't make backup
o.writebackup = false
o.swapfile = false -- don't make swapfile
o.showcmd = false -- don't show last cmd
o.confirm = true -- confirm before close unsaved file
o.updatetime = 300 -- default is 4000ms, it's too slow
o.completeopt = 'menuone,noinsert,noselect'
o.shortmess = 'c'
o.lazyredraw = true
o.ignorecase = true
o.smartcase = true
o.number = true -- show line number
o.cursorline = true -- highlight cursor line
o.showmatch = true -- highlight )
o.signcolumn = 'yes' -- always show signcolumn
o.showmode = false -- don't show mode
o.showbreak = '> ' -- show '> ' before break line
o.scrolloff = 7 -- always 7 lines under cursor
o.tabstop = 4 -- a tab is 4 spaces
o.softtabstop = 4 -- typing <tab> inserts 4 space
o.shiftwidth = 4 -- indent is 4 spaces
o.expandtab = true -- use only spaces, not tabs
o.smartindent = true
o.list = true -- show invisible characters
o.listchars = 'tab:>-,trail:⋅,extends:>,precedes:<'

vim.cmd([[autocmd Filetype lua,tex setlocal tabstop=2 shiftwidth=2 softtabstop=2]])
-- }}}

-- require('plugs') {{{
require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  -- Mapping helper
  use('LionC/nest.nvim')
  -- Coc
  use({
    'neoclide/coc.nvim',
    branch = 'release',
    config = function() require('config.coc') end
  })
  -- Status line
  use({
    'hoob3rt/lualine.nvim',
    requires = { 'kdheepak/tabline.nvim', 'kyazdani42/nvim-web-devicons' },
    config = function() require('config.sline') end
  })
  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'fannheyward/telescope-coc.nvim'},
    config = function() require('config.tele') end
  })
  -- File explorer
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('config.tree') end
  })
  -- Motion
  use('ggandor/lightspeed.nvim')
  -- Comment
  use({'b3nj5m1n/kommentary', config = function() require('config.komm') end})
  -- Startify
  use({'mhinz/vim-startify', config = function () require('config.start') end})
  -- Color
  use({'folke/tokyonight.nvim', branch ='main'})
end)

  -- Color settings
  g.tokyonight_style = 'night'
  vim.cmd([[colorscheme tokyonight]])
-- }}}

-- require('maps') {{{
local nest = require('nest')

nest.applyKeymaps({
    {mode = 'n', {
        -- save
        {'<c-s>', '<cmd>update<cr>'},
        -- close
        {'<c-q>', '<cmd>q<cr>'},
        -- new tab, split, vsplit
        {'<c-w>t', '<cmd>tabnew<cr>'},
        {'<c-w>s', '<cmd>sp<cr>'},
        {'<c-w>v', '<cmd>vs<cr>'},
        -- switch window
        {'<c-h>', '<c-w>h'},
        {'<c-j>', '<c-w>j'},
        {'<c-k>', '<c-w>k'},
        {'<c-l>', '<c-w>l'},
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
        -- save
        {'<c-s>', '<c-o><cmd>update<cr>'},
        -- close
        {'<c-q>', '<esc><cmd>q<cr>'},
        {'jk', '<esc>'},
    }},
    {mode = '!', {
        -- forward/back in I, C
        {'<c-f>', '<right>'},
        {'<c-b>', '<left>'},
        -- head/end in I, C
        {'<c-a>', '<home>'},
        {'<c-e>', '<end>'},
    }},
    {mode = '_', {
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
-- }}}

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
