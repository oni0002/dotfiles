-- Options
local g = vim.g
local o = vim.o
local cmd = vim.cmd

if vim.env.VIRTUAL_ENV then
  g.python3_host_prog = vim.env.VIRTUAL_ENV .. '/bin/python'
end
g.loaded_python_provider = 0

g.mapleader = ' '
g.maplocalleader = ','

o.termguicolors = true
o.clipboard = 'unnamedplus'  -- use system clipboard
o.mouse = 'a'  -- enable using mouse
o.splitright = true  -- split to right
o.splitbelow = true  -- split to below
o.backup = false  -- don't make backup
o.writebackup = false
o.swapfile = false  -- don't make swapfile
o.showcmd = false  -- don't show last cmd
o.confirm = true  -- confirm before close unsaved file
o.updatetime = 300  -- default is 4000ms, it's too slow
o.completeopt = 'menuone,noinsert,noselect'
o.shortmess = 'c'
o.lazyredraw = true
o.ignorecase = true
o.smartcase = true
o.number = true  -- show line number
o.cursorline = true  -- highlight cursor line
o.showmatch = true  -- highlight )
o.signcolumn = 'yes'  -- always show signcolumn
o.showmode = false  -- don't show mode
o.showbreak = '> '  -- show '> ' before break line
o.scrolloff = 7  -- always 7 lines under cursor
o.tabstop = 4  -- a tab is 4 spaces
o.softtabstop = 4  -- typing <tab> inserts 4 space
o.shiftwidth = 4  -- indent is 4 spaces
o.expandtab = true  -- use only spaces, not tabs
o.smartindent = true
o.list = true  -- show invisible characters
o.listchars = 'tab:>-,trail:⋅,extends:>,precedes:<'

cmd([[autocmd Filetype lua,tex setlocal tabstop=2 shiftwidth=2 softtabstop=2]])

-- Plugins
require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  use('LionC/nest.nvim')
  use({
    'neoclide/coc.nvim',
    branch = 'release',
    config = function() require('config.coc') end
  })
  use({
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('config.sline') end
  })
  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'fannheyward/telescope-coc.nvim'},
    config = function() require('config.tele') end
  })
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('config.tree') end
  })
  use('ggandor/lightspeed.nvim')
  use({'b3nj5m1n/kommentary', config = function() require('config.komm') end})
  use({'mhinz/vim-startify', config = function () require('config.start') end})
  use({'folke/tokyonight.nvim', branch ='main'})
end)

-- Color settings
g.tokyonight_style = 'night'
cmd([[colorscheme tokyonight]])

-- Maps
require('nest').applyKeymaps({
    {mode = 'n', {
        {'<c-s>', '<cmd>update<cr>'},  -- save
        {'<c-q>', '<cmd>q<cr>'},  -- close
        {'<c-w>t', '<cmd>tabnew<cr>'},  -- new tab
        {'<c-w>s', '<cmd>sp<cr>'},  -- split
        {'<c-w>v', '<cmd>vs<cr>'},  -- vsplit
        {'<c-h>', '<c-w>h'},  -- switch window
        {'<c-j>', '<c-w>j'},
        {'<c-k>', '<c-w>k'},
        {'<c-l>', '<c-w>l'},
        {'Y', 'y$'},  -- make Y more natural
        {';', ':', options = {silent = false}},  -- enter C
        {':', ';'},
        {'<esc>', '<cmd>noh<cr><esc>'},  -- clear hl
        {'U', '<c-r>'},  -- redo
        {'<leader>z', 'za'},  -- fold/unfold
        {']b', '<cmd>bn<cr>'},  -- next/prev buffer
        {'[b', '<cmd>bp<cr>'},
        {']t', '<cmd>tabn<cr>'},  -- next/prev tab
        {'[t', '<cmd>tabp<cr>'},
    }},
    {mode = 'i', {
        {'<c-s>', '<c-o><cmd>update<cr>'},  -- save
        {'<c-q>', '<esc><cmd>q<cr>'},  -- close
        {'jk', '<esc>'},
    }},
    {mode = '!', {
        {'<c-f>', '<right>'},  -- forward/back in I, C
        {'<c-b>', '<left>'},
        {'<c-a>', '<home>'},  -- head/end in I, C
        {'<c-e>', '<end>'},
    }},
    {mode = '_', {
        {'<tab>', '>gv'},  -- indent
        {'<s-tab>', '<gv'},
        {'j', 'gj'},  -- make j, k more natural
        {'k', 'gk'},
        {'H', '^'},  -- head/end
        {'L', '$'},
    }},
    {mode = 'c', {'jk', '<esc>'}},  -- exit C
    {mode = 't', {'<esc>', '<c-\\><c-n>'}},  -- exit T
})

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
