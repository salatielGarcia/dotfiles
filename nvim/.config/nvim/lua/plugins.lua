-- Migrate to use Lazy


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Basic plugins
	'navarasu/onedark.nvim',
	'windwp/nvim-autopairs',
	'terrortylor/nvim-comment',
	'kylechui/nvim-surround',
	'L3MON4D3/LuaSnip',
	'nvim-lualine/lualine.nvim',
	'kyazdani42/nvim-web-devicons',
	'sangdol/mintabline.vim',
	'numToStr/Comment.nvim',
	'nvim-lua/plenary.nvim',
	-- Telescope
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- Completion
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	-- -- LSP
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	-- DAP
	'mfussenegger/nvim-dap',
    'jay-babu/mason-nvim-dap.nvim',
	{"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
	},
	-- -- Treesitter
	'nvim-treesitter/nvim-treesitter',
	-- Wiki
	'jakewvincent/mkdnflow.nvim',
	-- -- Latex
	'lervag/vimtex',
	-- -- Startup
	'startup-nvim/startup.nvim',
	-- -- Neotree
	{"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"MunifTanjim/nui.nvim",
		}
	},
	-- Git 
	{"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",         -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim",        -- optional
			"ibhagwan/fzf-lua",              -- optional
		},
		config = true
	},
	'voldikss/vim-floaterm'
})

