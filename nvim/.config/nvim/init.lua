--[[
			(_) _ _  (_)| |_    | |
			| || ' \ | ||  _| _ | || || |/ _` |
			|_||_||_||_|\___|(_)|_| \_,_|\__,_|
										            By: Salatiel García
--]]

syst = 'lin'
kb   = 'eng'

if syst == 'lin' then
	initLua = '~/.config/nvim/'
	plugs = '~/.config/nvim/lua/plugins.lua'
	undoDir =  '/home/salatiel/.config/nvim/undodir/'
elseif syst == 'conti' then
	wikiFiles =  'D:/docs/wiki'
	initLua = '~/AppData/Local/nvim/'
	plugs = '~/AppData/Local/nvim/lua/plugins.lua'
	undoDir =  'C:/Users/uie84799/AppData/Local/nvim/undodir/'
	snipsFiles = 'D:/docs/snips/'
end
-- snipsFiles = 'D:/docs/snips/'
spellChoice = 'nil'

if kb == 'eng' then
	vim.g.mapleader = '\\'
	vim.g.maplocalleader = '\\'
elseif kb == 'esp' then
	vim.g.mapleader = '¿'
	vim.g.maplocalleader = '¿'
end
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
require('surround')
require('cmpSnips')
require('lsp')
require('treesit')
-- require('tabs') -- Current plugin is vimscript 'mintabline'
require('sline')
require('tele')
require('norg')
-- require('git') -- no current Git plugin
require('extras')
-- cmd('autocmd BufEnter,BufRead links.norg :setlocal nowrap')
require('comment')
