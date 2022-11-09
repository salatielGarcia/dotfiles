-- Custom status lualine
local opt = vim.opt

local scrollbarSymbols = {'─', '█', '▐', '▌'}
local colors = {
	comm = '%#NonText#',
	back = '%#EndOfBuffer#',
	float = '%#FloatBorder#',
	match = '%#FocusedSymbol#',
	fore = '%#TermCursorNC#',
	blue = '%#Directory#',
	red = '%#ErrorMsg#',
	yellow = '%#Question#',
	cyan = '%#Title#',
	purple = '%#Error#'
}
local icons = {
	lang = ' ',
	fold = ' ',
	loc  = ' ',
	git  = ' ',
}
local spacer = colors.back .. '  '
local tab = colors.back .. '  %='

local function getMode()
	local cMode = vim.api.nvim_get_mode().mode
	local col = ''
	if cMode == 'n' then
		col = colors.comm
	elseif cMode == 'i' then
		col = colors.blue
	elseif cMode == 'V' then
		col = colors.purple
	elseif cMode == 'C' then
		col = colors.yellow
	end
	return col .. cMode:upper()
end

local function spellStatus()
	local spell = ''
	if spellChoice ~= nil then
		spell = spellChoice
	end
	return colors.cyan .. icons.lang .. spell
end

local function apath()
	return colors.fore .. icons.fold .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end

local function percent(len)
	local pStat = vim.api.nvim_eval_statusline('%P', {}).str:gsub('%%', '')
	local nPer = 0.0
	local flen = 0
	local dec = 0
	local fbar = {}
	local bbar = {}
	if ((pStat == 'All') or (pStat == 'Bot'))  then
		flen = len
	elseif pStat == 'Top' then
		flen = 0
	else
		nPer = tonumber(pStat)
		local lenDiv = tostring(len * (nPer / 100))
		local findDecimal, _ = string.find(lenDiv, '%.')
		if (findDecimal) then
			local int, ldec = string.match(tostring(lenDiv), "([^.]*)%.([^.]*)")
			flen, dec = tonumber(int), tonumber(string.sub(ldec,1,1))
		else
			flen, dec = tonumber(lenDiv), 0
		end
	end
	for i = 1, flen do
		fbar[i] = scrollbarSymbols[2]
	end
	if (dec >= 2) and (dec <= 8) then
		fbar[#fbar + 1] = scrollbarSymbols[4]
	elseif dec > 8 then
		fbar[#fbar + 1] = scrollbarSymbols[2]
	end
	for i = 1, len - #fbar do
		bbar[i] = scrollbarSymbols[2]
	end
	local ffbar = table.concat(fbar)
	local bbbar = table.concat(bbar)
	return colors.purple .. icons.loc .. ffbar .. colors.float .. bbbar
end

local function git()
	local file = assert(io.popen('git rev-parse --abbrev-ref HEAD'))
	local out = file:read('all')
	print('out = ', out)
	return out
end

function Statusline()
	local parts = {
		spacer,
		getMode(),
		spacer,
		spellStatus(),
		spacer,
		apath(),
		tab,
		-- git(),
		spacer,
		-- lspStatus(),
		-- spacer,
		percent(15),
		spacer,
	}
	return table.concat(parts)
end

vim.opt.statusline = [[%!luaeval('Statusline()')]]

-- local status_ok, lualine = pcall(require, "lualine")
-- if not status_ok then
--     return
-- end
--
--
--
-- lualine.setup {
-- 	options = {
-- 		icons_enabled = true,
-- 		theme = 'onedark',
-- 		-- component_separators = {left = '', right = ''},
-- 		-- section_separators = {left = '', right = ''},
-- 		component_separators = {left = '', right = ''},
-- 		section_separators = {left = '', right = ''},
-- 		disabled_filetypes = {}
-- 	},
-- 	sections = {
-- 		lualine_a = {SpellStatus, color = { 'SpecialKey' } },
-- 		lualine_b = {'branch'},
-- 		lualine_c = {Apath},
-- 		-- lualine_x = {'encoding', 'fileformat', {'filetype', colored = true}},
-- 		lualine_x = {},
-- 		-- lualine_x = {},
-- 		lualine_y = {'progress'},
-- 		lualine_z = {'location'}
-- 	},
-- 	inactive_sections = {
-- 		lualine_a = {},
-- 		lualine_b = {},
-- 		lualine_c = {'filename'},
-- 		lualine_x = {'location'},
-- 		lualine_y = {},
-- 		lualine_z = {}
-- 	},
-- 	tabline = {},
-- 	extensions = {}
-- }
