local packer = require('packer')

if not packer then
  print('Packer was not found')

  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    print('Installing packer')

    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd('packadd packer.nvim')
    print('Packer has been installed successfully!')
  else
    print('Seems like packer is installed, but could not be loaded')
  end
end

packer.reset()

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end,
    prompt_border = 'single',
  },
  profile = {
    enable = true,
  },
  compile_on_sync = true,
})

return packer
