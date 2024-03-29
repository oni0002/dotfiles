local g = vim.g
local cmd = vim.cmd

g.coc_global_extensions = {
  'coc-snippets',
  'coc-lists',
  'coc-pairs',
  'coc-json',
  'coc-git',
  'coc-pyright',
  'coc-pydocstring',
  'coc-tabnine',
  'coc-lightbulb',
  'coc-markmap',
}
g.coc_borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'}
g.coc_snippet_next = '<tab>'
g.coc_snippet_next = '<c-j>'
g.coc_snippet_prev = '<c-k>'

-- Highlight the symbol and its references when holding the cursor.
cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
-- Add `:Format` command to format current buffer.
cmd([[command! -nargs=0 Format :call CocAction('format')]])
-- Add `:Fold` command to fold current buffer.
cmd([[command! -nargs=? Fold :call CocAction('fold', <f-args>)]])
-- Add `:OR` command for organize imports of the current buffer.
cmd([[command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')]])

cmd([[
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]])

-- Maps
require('nest').applyKeymaps({
  {mode = 'i', options = {expr = true}, {
    {'<tab>', "pumvisible() ? '<c-n>' : '<tab>'"},
    {'<s-tab>', "pumvisible() ? '<c-p>' : '<c-h>'"},
    {'<cr>', "pumvisible() ? coc#_select_confirm() : '<c-g>u<cr><c-r>=coc#on_enter()<cr>'"},
  }},
  {mode = 'n', {
    {'K', "<cmd>call CocActionAsync('doHover')<cr>"},
    options = {noremap = false}, {
      {'gd', '<plug>(coc-definition)'},
      {'gy', '<plug>(coc-type-definition)'},
      {'gi', '<plug>(coc-implementation)'},
      {'gr', '<plug>(coc-references)'},
      {'<leader>rn', '<plug>(coc-rename)'},
      {'<leader>f', '<plug>(coc-format)'},
      {'<leader>a', '<plug>(coc-codeaction)'},
    }
  }}
})
