local g = vim.g
local opt = vim.opt

-- python provider
if vim.env.VIRTUAL_ENV then
  g.python3_host_prog = vim.env.VIRTUAL_ENV .. '/bin/python'
end
g.loaded_python_provider = 0

-- leader
g.mapleader = ' '
g.maplocalleader = ','

g.coq_settings = {
  auto_start = true,
  clients = {
    tabnine = { enabled = true },
  },
  keymap = { jump_to_mark = '<c-j>' },
}

opt.termguicolors = true

opt.clipboard = 'unnamedplus' -- use system clipboard
opt.mouse = 'a' -- enable using mouse
opt.splitright = true -- split to right
opt.splitbelow = true -- split to below
opt.backup = false -- don't make backup
opt.writebackup = false
opt.swapfile = false -- don't make swapfile
opt.showcmd = false -- don't show last cmd
opt.confirm = true -- confirm before close unsaved file
opt.updatetime = 300 -- default is 4000ms, it's too slow
opt.completeopt = 'menuone,noinsert,noselect'
opt.shortmess = 'c'
opt.lazyredraw = true

opt.ignorecase = true
opt.smartcase = true

opt.number = true -- show line number
opt.cursorline = true -- highlight cursor line
opt.showmatch = true -- highlight )
opt.signcolumn = 'yes' -- always show signcolumn
opt.showmode = false -- don't show mode
opt.showbreak = '> ' -- show '> ' before break line
opt.scrolloff = 7 -- always 7 lines under cursor

opt.tabstop = 4 -- a tab is 4 spaces
opt.softtabstop = 4 -- typing <tab> inserts 4 space
opt.shiftwidth = 4 -- indent is 4 spaces
opt.expandtab = true -- use only spaces, not tabs
opt.smartindent = true

opt.list = true -- show invisible characters
opt.listchars = 'tab:>-,trail:⋅,extends:>,precedes:<'

vim.cmd([[colorscheme neg]])
