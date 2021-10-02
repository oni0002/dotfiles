-- init.lua

-- require('opts') {{{
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
-- }}}

-- require('plugs') {{{

-- packer config {{{
local packer = require('packer')

if not packer then
  print('Packer was not found')

  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    print('Installing packer')

    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd('packadd packer.nvim')
    print('Packer has been installed successfully!')
  else
    print('Seems like packer is installed, but could not be loaded')
  end
end

packer.reset()

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end,
    prompt_border = 'single',
  },
  profile = {
    enable = true,
  },
  compile_on_sync = true,
})  -- }}}

--- Plugins
packer.startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  -- completion
  use({ 'ms-jpq/coq_nvim', branch = 'coq' }) -- main one
  use({ 'ms-jpq/coq.artifacts', branch = 'artifacts' }) -- 9000+ Snippets
  -- lua config
  use({ 'folke/lua-dev.nvim' })
  -- lsp
  use({ 'neovim/nvim-lspconfig' })
  -- format
  use({
    'mhartington/formatter.nvim',
    cmd = { 'Format', 'FormatWrite' },
    config = function()  -- {{{
      local formatter = require('formatter')

      formatter.setup({
        filetype = {
          lua = {
            function()
              return {
                exe = 'stylua',
                args = { '--config-path', 'stylua.toml', '-' },
                stdin = true,
              }
            end,
          },
        },
      })

      vim.api.nvim_exec([[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.js,*.rs,*.lua,*.py FormatWrite
      augroup END
      ]], true)
    end,  -- }}}
  })
  -- ls install
  use('kabouzeid/nvim-lspinstall')
  -- pictogram for lsp
  use('onsails/lspkind-nvim')
  -- diagnostics list
  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end,
  })
  -- gitsign
  use "lewis6991/gitsigns.nvim"
  -- status line
  use({
    'hoob3rt/lualine.nvim',
    requires = { 'kdheepak/tabline.nvim', 'kyazdani42/nvim-web-devicons' },
    config = function()  -- {{{
      require('tabline').setup({
          enable = false,
          options = {
              section_separators = {'', ''},
              -- component_separators = {'', ''},
              component_separators = {'', ''},
          }
      })

      require('lualine').setup {
        options = {
          theme = 'tokyonight',
          -- theme = neg,
          section_separators = {'', ''},
          -- component_separators = {'', ''},
          component_separators = {'', ''},
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {
            {'branch', icon = ""},
          },
          lualine_c = {
            {'filename'},
            -- {'diagnostics', sources = {'lsp'}, sections = {'error', 'warn'}}
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
      }
    end,  -- }}}
  })
  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    cmd = { 'Telescope' },
    config = function()  -- {{{
      require('telescope').setup({
        defaults = {
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
          },
        },
      })
    end,  -- }}}
  })
  -- file explorer
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = { 'NvimTreeToggle' },
    config = function()  -- {{{
      local tree_cb = require('nvim-tree.config').nvim_tree_callback

      vim.g.nvim_tree_auto_close = 1
      vim.g.nvim_tree_quit_on_open = 1

      vim.g.nvim_tree_bindings = {
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
    end,  -- }}}
  })
  -- motion
  use('ggandor/lightspeed.nvim')
  -- comment
  use({
    'b3nj5m1n/kommentary',
    config = function()  -- {{{
      vim.g.kommentary_create_default_mappings = false

      require('kommentary.config').configure_language('default', {
        prefer_single_line_comments = true,
      })
      require('kommentary.config').configure_language('python', {
        single_line_comment_string = '#',
      })
    end,  -- }}}
  })
  -- startify
  use({
    'mhinz/vim-startify',
    config = function ()  -- {{{
      local fn = vim.fn
      vim.g.startify_change_to_dir = 0
      vim.g.startify_relative_path = 1
      vim.g.startify_use_env = 1
      -- vim.g.startify_custom_header = fn['startify#center'](fn.split(fn.system('figlet -f tengwar -w 100 neovim'), '\n'))
      vim.g.startify_custom_header = [[startify#center(split(system('figlet -f ntgreek -w 100 neovim'), '\n'))]]

      vim.g.startify_lists = {
        { type = 'commands', header = {'   Commands'}},
        { type = 'bookmarks', header = {'   Bookmarks'}},
      }

      -- commands
      vim.g.startify_commands = {
        { f = { 'Find files', ':Telescope find_files' } },
        { h = { 'Recentry', ':Telescope oldfiles' } },
        { w = { 'Find words', ':Telescope live_grep' } },
        { up = { 'Update Plugins', ':PackerSync' } },
      }

      -- bookmarks
      vim.g.startify_bookmarks = {
        { c = '~/.config/nvim/init.lua' },
      }
    end  -- }}}
  })
  -- autopair
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  })
  -- key mapping helper
  use({ 'LionC/nest.nvim' })
  -- color
  use({
    'folke/tokyonight.nvim',
    branch ='main'
  })
end)

  g.tokyonight_style = 'night'
  vim.cmd([[colorscheme tokyonight]])
-- }}}

-- require('maps') {{{
local nest = require('nest')

-- general mappings
nest.applyKeymaps({
    {mode = 'n', {
        {'<c-', {
            -- save
            {'s>', '<cmd>update<cr>'},
            -- close
            {'q>', '<cmd>q<cr>'},
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
    {'w', '<cmd>Telescope live_grep<cr>'},
    {';', '<cmd>Telescope commands<cr>'},
    {'l', '<cmd>Telescope current_buffer_fuzzy_find<cr>'},
    {'m', '<cmd>Telescope keymaps<cr>'},
    {'?', '<cmd>Telescope help_tags<cr>'},
    {'d', '<cmd>Telescope lsp_document_diagnostics<cr>'},
    {'a', '<cmd>Telescope lsp_code_actions<cr>'},
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
-- }}}

-- require('lsp') {{{
local vim = vim
local lsp = require('lspconfig')
local coq = require('coq')
-- local nullls = require('null-ls')

vim.lsp.setup({
  floating_preview = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
  diagnostics = {
    signs = { error = " ", warning = " ", hint = " ", information = " " },
    display = {
      underline = true,
      update_in_insert = false,
      -- virtual_text = { spacing = 4, prefix = "●" },
      virtual_text = false,
      severity_sort = true,
    },
  },
})

-- require('config.nullls')

-- language specific
local configs = {
  lua = require('lua-dev').setup({
    lspconfig = {
      setting = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    },
  }),
}

-- lsp-install
local function setup_servers()
  require('lspinstall').setup()
  local servers = require('lspinstall').installed_servers()
  for _, server in pairs(servers) do
    lsp[server].setup(coq.lsp_ensure_capabilities(configs[server] or {}))
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require('lspinstall').post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end

require('lspkind').init()
-- }}}

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
