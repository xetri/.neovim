local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim' --Package manager

  use 'lewis6991/impatient.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'folke/tokyonight.nvim'
  use 'hoob3rt/lualine.nvim'

  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-telescope/telescope.nvim'

  use 'christoomey/vim-tmux-navigator'
  use 'ThePrimeagen/harpoon'

  use 'windwp/nvim-autopairs'
  use 'terrortylor/nvim-comment'
  use 'github/copilot.vim'

  use 'folke/which-key.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end

end)
