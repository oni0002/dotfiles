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

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.py FormatWrite
augroup END
]],
  true
)
