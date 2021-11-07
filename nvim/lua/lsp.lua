local vim = vim
local lsp = require('lspconfig')
local coq = require('coq')
-- local nullls = require('null-ls')

-- require('config.nullls')

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

-- map
local nest = require('nest')
nest.applyKeymaps({
    {'gd', '<cmd>lua vim.lsp.buf.definition()<cr>'},
    {'K', '<cmd>lua vim.lsp.buf.hover()<cr>'},
    {'<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>'},
    {'gr', '<cmd>lua vim.lsp.buf.reference()<cr>'},
    {'<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>'},
    {'<leader>xx', '<cmd>TroubleToggle<cr>'},
    {'<leader>f', '<cmd>Format<cr>'},
})
