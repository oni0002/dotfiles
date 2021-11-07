vim.g.startify_change_to_dir = 0
vim.g.startify_relative_path = 1
vim.g.startify_use_env = 1
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
