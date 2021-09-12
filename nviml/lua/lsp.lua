local vim = vim
local lsp = require('lspconfig')
local coq = require('coq')
-- local nullls = require('null-ls')

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
