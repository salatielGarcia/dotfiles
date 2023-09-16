--[[
			(_) _ _  (_)| |_    | |
			| || ' \ | ||  _| _ | || || |/ _` |
			|_||_||_||_|\___|(_)|_| \_,_|\__,_|
										            By: Salatiel García
--]]

syst = 'conti'
kb   = 'esp'

if syst == 'lin' then
	initLua = '~/.config/nvim/'
	plugs = '~/.config/nvim/lua/plugins.lua'
	undoDir =  '/home/salatiel/.config/nvim/undodir/'
elseif syst == 'conti' then
	wikiFiles =  'C:/Users/uie84799/OneDrive - Continental AG/Documents/docs/notes/conti/wiki'
	initLua = 'C:/Users/uie84799/AppData/Local/nvim/'
	plugs = 'C:/Users/uie84799/AppData/Local/nvim/lua/plugins.lua'
	undoDir =  'C:/Users/uie84799/AppData/Local/nvim/undodir/'
	snipsFiles = 'C:/Users/uie84799/OneDrive - Continental AG/Documents/docs/snips'
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

if vim.g.neovide then
	vim.opt.guifont = {'Hack\\ Nerd\\ Font\\ Mono:h12'}
	vim.g.neovide_scale_factor = 0.80
	vim.g.neovide_transparency = 0.85
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_cursor_animation_length = 0.02
end

require('bconfig')
require('mappings')
-- Basic plugins
require('plugins')
require('color')
require('nvim-autopairs').setup()
require('surround')
require('Comment').setup()
require('sline')
-- Telescope
require('tele')
-- Completion
require('cmpSnips')
-- LSP
require('lsp')
-- Treesitter
-- require('treesit')
require('norg')
-- Neo Tree
require('tree')
require('neogit').setup()

require('startup').setup()
cmd 'cd D:/DSUsers/uie84799/fbak/Documents/docs'
