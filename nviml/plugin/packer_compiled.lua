-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/ly/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/ly/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/ly/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/ly/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/ly/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["coq.artifacts"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/coq.artifacts"
  },
  coq_nvim = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/coq_nvim"
  },
  ["formatter.nvim"] = {
    commands = { "Format", "FormatWrite" },
    config = { "\27LJ\2\nQ\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\18--config-path\16stylua.toml\6-\1\0\2\nstdin\2\bexe\vstylua˜\2\1\0\a\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0004\5\3\0003\6\3\0>\6\1\5=\5\5\4=\4\a\3B\1\2\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0+\4\2\0B\1\3\1K\0\1\0Š\1      augroup FormatAutogroup\n        autocmd!\n        autocmd BufWritePost *.js,*.rs,*.lua,*.py FormatWrite\n      augroup END\n      \14nvim_exec\bapi\bvim\rfiletype\1\0\0\blua\1\0\0\0\nsetup\14formatter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\nø\1\0\0\4\0\n\0\0196\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0005\3\a\0B\0\3\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\b\0005\3\t\0B\0\3\1K\0\1\0\1\0\1\31single_line_comment_string\6#\vpython\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire'kommentary_create_default_mappings\6g\bvim\0" },
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n®\5\0\0\b\0\"\0I6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\0\2\0005\2\14\0005\3\v\0005\4\f\0=\4\6\0035\4\r\0=\4\b\3=\3\t\0025\3\16\0005\4\15\0=\4\17\0034\4\3\0005\5\18\0>\5\1\4=\4\19\0034\4\3\0005\5\20\0>\5\1\0045\5\21\0005\6\22\0=\6\23\0055\6\24\0=\6\25\5>\5\2\4=\4\26\0035\4\27\0=\4\28\0034\4\0\0=\4\29\0034\4\0\0=\4\30\3=\3\25\0025\3\31\0004\4\0\0=\4\17\0034\4\0\0=\4\19\0034\4\3\0006\5\0\0'\a\1\0B\5\2\0029\5 \5>\5\1\4=\4\26\0034\4\3\0006\5\0\0'\a\1\0B\5\2\0029\5!\5>\5\1\4=\4\28\0034\4\0\0=\4\29\0034\4\0\0=\4\30\3=\3\1\2B\0\2\1K\0\1\0\17tabline_tabs\20tabline_buffers\1\0\0\14lualine_z\14lualine_y\14lualine_x\1\5\0\0\16file_format\rencoding\rfiletype\rlocation\14lualine_c\rsections\1\3\0\0\nerror\twarn\fsources\1\2\0\0\bcoc\1\2\0\0\16diagnostics\1\2\0\0\rfilename\14lualine_b\1\2\1\0\vbranch\ticon\bîœ¥\14lualine_a\1\0\0\1\2\0\0\tmode\1\0\0\1\3\0\0\5\5\1\3\0\0\bî‚´\bî‚¶\1\0\1\ntheme\15tokyonight\flualine\foptions\25component_separators\1\3\0\0\5\5\23section_separators\1\0\0\1\3\0\0\bî‚´\bî‚¶\1\0\1\venable\1\nsetup\ftabline\frequire\0" },
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nest.nvim"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/nest.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\nÝ\6\0\0\a\0*\0o6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0009\1\4\1)\2\1\0=\2\5\0016\1\3\0009\1\4\1)\2\1\0=\2\6\0016\1\3\0009\1\4\0014\2\16\0005\3\t\0005\4\b\0=\4\n\3\18\4\0\0'\6\v\0B\4\2\2=\4\f\3>\3\1\0025\3\14\0005\4\r\0=\4\n\3\18\4\0\0'\6\15\0B\4\2\2=\4\f\3>\3\2\0025\3\16\0\18\4\0\0'\6\17\0B\4\2\2=\4\f\3>\3\3\0025\3\18\0\18\4\0\0'\6\19\0B\4\2\2=\4\f\3>\3\4\0025\3\20\0\18\4\0\0'\6\21\0B\4\2\2=\4\f\3>\3\5\0025\3\22\0\18\4\0\0'\6\23\0B\4\2\2=\4\f\3>\3\6\0025\3\24\0\18\4\0\0'\6\25\0B\4\2\2=\4\f\3>\3\a\0025\3\26\0\18\4\0\0'\6\27\0B\4\2\2=\4\f\3>\3\b\0025\3\28\0\18\4\0\0'\6\29\0B\4\2\2=\4\f\3>\3\t\0025\3\30\0\18\4\0\0'\6\31\0B\4\2\2=\4\f\3>\3\n\0025\3 \0\18\4\0\0'\6!\0B\4\2\2=\4\f\3>\3\v\0025\3\"\0\18\4\0\0'\6#\0B\4\2\2=\4\f\3>\3\f\0025\3$\0\18\4\0\0'\6%\0B\4\2\2=\4\f\3>\3\r\0025\3&\0\18\4\0\0'\6'\0B\4\2\2=\4\f\3>\3\14\0025\3(\0\18\4\0\0'\6)\0B\4\2\2=\4\f\3>\3\15\2=\2\a\1K\0\1\0\nclose\1\0\1\bkey\6q\vdir_up\1\0\1\bkey\6-\14copy_path\1\0\1\bkey\6Y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6y\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\15close_node\1\0\1\bkey\t<BS>\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\23nvim_tree_bindings\27nvim_tree_quit_on_open\25nvim_tree_auto_close\6g\bvim\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["tabline.nvim"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/tabline.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\nš\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\rdefaults\1\0\0\18layout_config\1\0\1\20prompt_position\btop\1\0\1\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\nÊ\5\0\0\5\0\29\00096\0\0\0009\0\1\0006\1\0\0009\1\2\1)\2\0\0=\2\3\0016\1\0\0009\1\2\1)\2\1\0=\2\4\0016\1\0\0009\1\2\1)\2\1\0=\2\5\0016\1\0\0009\1\2\1'\2\a\0=\2\6\0016\1\0\0009\1\2\0014\2\3\0005\3\t\0005\4\n\0=\4\v\3>\3\1\0025\3\f\0005\4\r\0=\4\v\3>\3\2\2=\2\b\0016\1\0\0009\1\2\0014\2\5\0005\3\16\0005\4\15\0=\4\17\3>\3\1\0025\3\19\0005\4\18\0=\4\20\3>\3\2\0025\3\22\0005\4\21\0=\4\23\3>\3\3\0025\3\25\0005\4\24\0=\4\26\3>\3\4\2=\2\14\0016\1\0\0009\1\2\0014\2\3\0005\3\28\0>\3\1\2=\2\27\1K\0\1\0\1\0\1\6c\28~/.config/nvim/init.lua\23startify_bookmarks\aup\1\0\0\1\3\0\0\19Update Plugins\14:PackSync\6w\1\0\0\1\3\0\0\15Find words\25:Telescope live_grep\6h\1\0\0\1\3\0\0\rRecentry\24:Telescope oldfiles\6f\1\0\0\1\3\0\0\15Find files\26:Telescope find_files\22startify_commands\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\vheader\1\2\0\0\16   Commands\1\0\1\ttype\rcommands\19startify_listsLstartify#center(split(system('figlet -f ntgreek -w 100 neovim'), '\\n'))\27startify_custom_header\21startify_use_env\27startify_relative_path\27startify_change_to_dir\6g\afn\bvim\0" },
    loaded = true,
    path = "/Users/ly/.local/share/nvim/site/pack/packer/start/vim-startify"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n®\5\0\0\b\0\"\0I6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\0\2\0005\2\14\0005\3\v\0005\4\f\0=\4\6\0035\4\r\0=\4\b\3=\3\t\0025\3\16\0005\4\15\0=\4\17\0034\4\3\0005\5\18\0>\5\1\4=\4\19\0034\4\3\0005\5\20\0>\5\1\0045\5\21\0005\6\22\0=\6\23\0055\6\24\0=\6\25\5>\5\2\4=\4\26\0035\4\27\0=\4\28\0034\4\0\0=\4\29\0034\4\0\0=\4\30\3=\3\25\0025\3\31\0004\4\0\0=\4\17\0034\4\0\0=\4\19\0034\4\3\0006\5\0\0'\a\1\0B\5\2\0029\5 \5>\5\1\4=\4\26\0034\4\3\0006\5\0\0'\a\1\0B\5\2\0029\5!\5>\5\1\4=\4\28\0034\4\0\0=\4\29\0034\4\0\0=\4\30\3=\3\1\2B\0\2\1K\0\1\0\17tabline_tabs\20tabline_buffers\1\0\0\14lualine_z\14lualine_y\14lualine_x\1\5\0\0\16file_format\rencoding\rfiletype\rlocation\14lualine_c\rsections\1\3\0\0\nerror\twarn\fsources\1\2\0\0\bcoc\1\2\0\0\16diagnostics\1\2\0\0\rfilename\14lualine_b\1\2\1\0\vbranch\ticon\bîœ¥\14lualine_a\1\0\0\1\2\0\0\tmode\1\0\0\1\3\0\0\5\5\1\3\0\0\bî‚´\bî‚¶\1\0\1\ntheme\15tokyonight\flualine\foptions\25component_separators\1\3\0\0\5\5\23section_separators\1\0\0\1\3\0\0\bî‚´\bî‚¶\1\0\1\venable\1\nsetup\ftabline\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\nÊ\5\0\0\5\0\29\00096\0\0\0009\0\1\0006\1\0\0009\1\2\1)\2\0\0=\2\3\0016\1\0\0009\1\2\1)\2\1\0=\2\4\0016\1\0\0009\1\2\1)\2\1\0=\2\5\0016\1\0\0009\1\2\1'\2\a\0=\2\6\0016\1\0\0009\1\2\0014\2\3\0005\3\t\0005\4\n\0=\4\v\3>\3\1\0025\3\f\0005\4\r\0=\4\v\3>\3\2\2=\2\b\0016\1\0\0009\1\2\0014\2\5\0005\3\16\0005\4\15\0=\4\17\3>\3\1\0025\3\19\0005\4\18\0=\4\20\3>\3\2\0025\3\22\0005\4\21\0=\4\23\3>\3\3\0025\3\25\0005\4\24\0=\4\26\3>\3\4\2=\2\14\0016\1\0\0009\1\2\0014\2\3\0005\3\28\0>\3\1\2=\2\27\1K\0\1\0\1\0\1\6c\28~/.config/nvim/init.lua\23startify_bookmarks\aup\1\0\0\1\3\0\0\19Update Plugins\14:PackSync\6w\1\0\0\1\3\0\0\15Find words\25:Telescope live_grep\6h\1\0\0\1\3\0\0\rRecentry\24:Telescope oldfiles\6f\1\0\0\1\3\0\0\15Find files\26:Telescope find_files\22startify_commands\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\vheader\1\2\0\0\16   Commands\1\0\1\ttype\rcommands\19startify_listsLstartify#center(split(system('figlet -f ntgreek -w 100 neovim'), '\\n'))\27startify_custom_header\21startify_use_env\27startify_relative_path\27startify_change_to_dir\6g\afn\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\nø\1\0\0\4\0\n\0\0196\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0005\3\a\0B\0\3\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\b\0005\3\t\0B\0\3\1K\0\1\0\1\0\1\31single_line_comment_string\6#\vpython\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire'kommentary_create_default_mappings\6g\bvim\0", "config", "kommentary")
time([[Config for kommentary]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FormatWrite lua require("packer.load")({'formatter.nvim'}, { cmd = "FormatWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
