local packer = require('config.packer')

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
  -- use {
  --     'jose-elias-alvarez/null-ls.nvim',
  --     requires = {'nvim-lua/plenary.nvim',
  --     config = function() require('config.nullls') end,
  -- }}
  use({
    'mhartington/formatter.nvim',
    cmd = { 'Format', 'FormatWrite' },
    config = function()
      require('config.formatter')
    end,
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
  use "lewis6991/gitsigns.nvim"

  -- status line
  use({
    'hoob3rt/lualine.nvim',
    requires = { 'kdheepak/tabline.nvim', 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('config.line')
    end,
  })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    cmd = { 'Telescope' },
    config = function()
      require('config.telescope')
    end,
  })

  -- file explorer
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = { 'NvimTreeToggle' },
    config = function()
      require('config.nvimtree')
    end,
  })

  -- navigation
  use('ggandor/lightspeed.nvim')

  -- comment
  use({
    'b3nj5m1n/kommentary',
    config = function()
      require('config.kommentary')
    end,
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
end)
