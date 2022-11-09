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
	use {'kyazdani42/nvim-web-devicons'}
	use {'sangdol/mintabline.vim'}
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
	-- use {'nvim-treesitter/playground'}
--
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}} }
	use {'Triton171/telescope-better-find-files.nvim'}
--
	use {'nvim-neorg/neorg'}

	use {'mfussenegger/nvim-dap'}
	-- use {'gorbit99/codewindow.nvim',
	-- 	config = function ()
	-- 		local codewindow = require('codewindow')
	-- 		codewindow.setup{
	-- 			  active_in_terminals = false, -- Should the minimap activate for terminal buffers
	-- 			  auto_enable = false, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
	-- 			  exclude_filetypes = {}, -- Choose certain filetypes to not show minimap on
	-- 			  max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
	-- 			  max_lines = nil, -- If auto_enable is true, don't open the minimap for buffers which have more than this many lines.
	-- 			  minimap_width = 15, -- The width of the text part of the minimap
	-- 			  use_lsp = true, -- Use the builtin LSP to show errors and warnings
	-- 			  use_treesitter = true, -- Use nvim-treesitter to highlight the code
	-- 			  width_multiplier = 4, -- How many characters one dot represents
	-- 			  z_index = 0, -- The z-index the floating window will be on
	-- 		}
	-- 		codewindow.apply_default_keybinds()
	-- 	end
	-- }
	-- use {'f-person/git-blame.nvim'}
	-- use{'lervag/vimtex'}
	-- use {"blackCauldron7/surround.nvim"}
	-- use{'cespare/vim-toml'}
	-- use{'glepnir/dashboard-nvim'}
end)
