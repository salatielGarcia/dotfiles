--[[
			(_) _ _  (_)| |_    | |
			| || ' \ | ||  _| _ | || || |/ _` |
			|_||_||_||_|\___|(_)|_| \_,_|\__,_|
										            By: Salatiel García
--]]

initLua = '~/.config/nvim/init.lua'
plugs = '~/.config/nvim/lua/plugins.lua'
undoDir =  '/home/salatiel/.config/nvim/undodir/'
-- snipsFiles = 'D:/docs/snips/'
spellChoice = "nil"
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'
cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
require('bconfig')
require('mappings')
require('plugins')
require('color')
require('nvim-autopairs').setup{}
require('comment')
require('surround')
require('cmdSnips')
require('lsp')
-- require('treesit')
require('org')
 require('sline')
 require('tele')
-- require('extras')
-- cmd('autocmd BufEnter,BufRead links.norg :setlocal nowrap')
