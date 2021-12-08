local g = vim.g

g.startify_change_to_dir = 0
g.startify_relative_path = 1
g.startify_use_env = 1
g.startify_custom_header = [[startify#center(split(system('figlet -f ntgreek -w 100 neovim'), '\n'))]]

g.startify_lists = {
  {type = 'commands', header = {'   Commands'}},
  {type = 'bookmarks', header = {'   Bookmarks'}},
}
-- commands
g.startify_commands = {
  {f = {'Find files', ':Telescope find_files'}},
  {h = {'Recentry', ':Telescope oldfiles'}},
  {w = {'Find words', ':Telescope live_grep'}},
  {up = {'Update Plugins', ':PackerSync'}},
  {uc = {'Update Coc', ':CocUpdate'}},
}
-- bookmarks
g.startify_bookmarks = {
  {c = '~/.config/nvim/init.lua'},
}
