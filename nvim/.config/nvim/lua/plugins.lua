-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local g = vim.g      -- a table to access global variables
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	-- Packer can manage itself
	use {'wbthomason/packer.nvim'}
	use {'nvim-lua/plenary.nvim'}
	use {'navarasu/onedark.nvim'}
	use {'windwp/nvim-autopairs'}
	use {'numToStr/Comment.nvim'}
	use {'kylechui/nvim-surround'}
	use {'L3MON4D3/LuaSnip'}
	use {'nvim-lualine/lualine.nvim'}
	use {'crispgm/nvim-tabline'}
	use {'kyazdani42/nvim-web-devicons'}
--
	use {'saadparwaiz1/cmp_luasnip'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {'f3fora/cmp-spell'}
	use {'hrsh7th/cmp-nvim-lua'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/nvim-cmp'}
--
	use {'neovim/nvim-lspconfig'}
	use {'williamboman/mason.nvim'}
	use {'williamboman/mason-lspconfig.nvim'}
	use {'nvim-treesitter/nvim-treesitter'}
	use {'nvim-treesitter/playground'}
--
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}} }
	use {'Triton171/telescope-better-find-files.nvim'}
--
	-- use {'nvim-neorg/neorg', requires = {{'nvim-lua/plenary.nvim'}}}
	-- use{'lervag/vimtex'}
	-- use {"blackCauldron7/surround.nvim"}
	-- use{'cespare/vim-toml'}
	-- use{'glepnir/dashboard-nvim'}
end)
