local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local function Apath()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end

local function SpellStatus()
	return spellChoice
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'onedark',
		component_separators = {left = '', right = ''},
		section_separators = {left = '', right = ''},
		disabled_filetypes = {}
	},
	sections = {
		lualine_a = {SpellStatus},
		lualine_b = {'branch'},
		lualine_c = {Apath},
		lualine_x = {'encoding', 'fileformat', {'filetype', colored = true}},
		-- lualine_x = {},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}
