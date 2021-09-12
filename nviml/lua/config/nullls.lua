local nullls = require("null-ls")

nullls.config = {
  sources = {
    nullls.builtins.formatting.stylua.with({
      args = { "--indent_width=2", "--quate_style=AutoPreferSingle", "indent-type=Spaces", "-" },
    }),
    nullls.builtins.formatting.black,
  },
}
require("lspconfig")["null-ls"].setup({
  on_attach = function(client)
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
