-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local g = vim.g      -- a table to access global variables

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {'windwp/nvim-autopairs'}
	-- use {'joshdick/onedark.vim'}
	use{'scrooloose/nerdcommenter'}
	use {'SirVer/ultisnips'}
	use{'machakann/vim-sandwich'}
	use {'navarasu/onedark.nvim'}
	use {'neovim/nvim-lspconfig'}
	use {'kabouzeid/nvim-lspinstall'}
	use {'tjdevries/nlua.nvim'}
	use {'hrsh7th/nvim-compe'}
	use {'nvim-lua/plenary.nvim'}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use {'kyazdani42/nvim-web-devicons'}
	use {
	  'hoob3rt/lualine.nvim',
	  requires = {'kyazdani42/nvim-web-devicons', opt = true},
	}
	-- use {
	  -- 'romgrk/barbar.nvim',
	  -- requires = {'kyazdani42/nvim-web-devicons', opt = true},
	  -- options = {
			-- theme = 'onedark'
		-- }
	-- }
	use {'udalov/kotlin-vim'}
	use{'lervag/vimtex'}
	use {"blackCauldron7/surround.nvim"}
	use{'cespare/vim-toml'}
	-- use{'glepnir/dashboard-nvim'}
end)
