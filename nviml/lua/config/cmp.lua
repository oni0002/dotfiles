local lspkind = require("lspkind")
local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "buffer" },
    { name = "nvim_lsp" },
    { name = "cmp_tabnine" },
    { name = "cmp_luasnip" },
  },
  mapping = {
    ["<cr>"] = cmp.mapping.confirm(),
    ["<c-p>"] = cmp.mapping.select_prev_item(),
    ["<c-n>"] = cmp.mapping.select_next_item(),
  },
  snippet = {
    expand = function(args)
      local luasnip = require("luasnip")
      if not luasnip then
        return
      end
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      return vim_item
    end,
  },
})
