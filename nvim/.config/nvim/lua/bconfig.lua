local opt = vim.opt  -- to set options
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
-- cmd "hi Comment guifg=#6F7A91"
cmd('language en_US')
opt.path = opt.path + '**'
opt.number = true
opt.relativenumber = true
opt.mouse ='a'
opt.termguicolors = true
opt.ignorecase = true
opt.smartindent = true
opt.smarttab = true
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = -1
opt.shiftwidth = 0
opt.linebreak = true
opt.swapfile = false
opt.backup = false
opt.undodir = undoDir
opt.undofile = true
opt.cursorline = true
opt.clipboard = 'unnamedplus'
opt.complete = opt.complete + 'kspell'
opt.splitright = true
opt.splitbelow = true
opt.breakindent = true
opt.autowrite = true
opt.laststatus = 3
-- opt.autochdir = true
opt.wildmode = 'longest:full'
opt.showmode = false
opt.showtabline = 2
opt.completeopt = {"menuone", "preview"}
-- opt.guitablabel = '%N\\ %f'
-- opt.tabline = "%#Directory# %f %= %l,%c %= %p%%"
--
-- Remember previous position
if fn.has('autocmd') then
	cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]])
end
--
-- Change comments color
-- local ns = vim.api.nvim_create_namespace('')
-- vim.api.nvim__set_hl_ns(ns)
-- vim.api.nvim_set_hl(ns, 'Comment', {fg = '#6F7A91'})
--
-- Highlight yank
cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="WildMenu", timeout=100}) 
augroup END
]])
