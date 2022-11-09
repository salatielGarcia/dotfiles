local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require('telescope.actions')
telescope.setup{
	defaults = {
		file_ignore_patterns = {'undodir', '*.jpeg',  '*.png',  '*.pdf'},
		mappings = {
			i = {
				-- To disable a keymap, put [map] = false
				-- So, to not map "<C-n>", just put
				["<C-n>"] = false,
				["<esc>"] = actions.close,
				-- Otherwise, just set the mapping to the function that you want it to be.
				["<C-i>"] = actions.select_horizontal,
				-- Add up multiple actions
				["<cr>"] = actions.select_default + actions.center,
				-- -- You can perform as many actions in a row as you like
				-- ["<cr>"] = actions.select_default + actions.center + my_cool_custom_action,
			},
			n = {
				-- ["<C-i>"] = my_cool_custom_action,
			},
		}
	}
}
-- telescope.setup{
-- 	defaults = {
-- 		vimgrep_arguments = {
-- 			'rg',
-- 			'--color=never',
-- 			'--no-heading',
-- 			'--with-filename',
-- 			'--line-number',
-- 			'--column',
-- 			'--smart-case'
-- 		},
-- 		file_ignore_patterns = {'undodir', '*.jpeg',  '*.png',  '*.pdf'},
-- 		prompt_prefix = " ",
-- 		selection_caret = "⟫ ",
-- 		entry_prefix = "  ",
-- 		initial_mode = "insert",
-- 		selection_strategy = "reset",
-- 		sorting_strategy = "descending",
-- 		layout_strategy = "horizontal",
-- 		layout_config = {
-- 			horizontal = {
-- 				mirror = false,
-- 			},
-- 			vertical = {
-- 				mirror = false,
-- 			},
-- 		},
-- 		file_sorter =  require'telescope.sorters'.get_fuzzy_file,
-- 		file_ignore_patterns = {},
-- 		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
-- 		winblend = 0,
-- 		border = {},
-- 		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
-- 		color_devicons = true,
-- 		use_less = true,
-- 		path_display = {},
-- 		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
-- 		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
-- 		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
-- 		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
-- 		-- Developer configurations: Not meant for general override
-- 		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
-- 		mappings = {
-- 			i = {
-- 				-- To disable a keymap, put [map] = false
-- 				-- So, to not map "<C-n>", just put
-- 				["<C-n>"] = false,
-- 				["<esc>"] = actions.close,
-- 				-- Otherwise, just set the mapping to the function that you want it to be.
-- 				["<C-i>"] = actions.select_horizontal,
-- 				-- Add up multiple actions
-- 				["<cr>"] = actions.select_default + actions.center,
-- 				-- -- You can perform as many actions in a row as you like
-- 				-- ["<cr>"] = actions.select_default + actions.center + my_cool_custom_action,
-- 			},
-- 			n = {
-- 				-- ["<C-i>"] = my_cool_custom_action,
-- 			},
-- 		}
-- 	},
-- 	extensions = {
-- 		better_find_files = {
-- 			-- A list of file extensions that should be opened with an external program
-- 			external_file_types = {"pdf", "png", "jpg", "gif", "mp4", "docx", "xlsx"},
-- 			-- The command to open a file
-- 			external_open_cmd = 'start \"\" '
-- 		}
--   },
-- }
require('telescope').load_extension('better_find_files')

-- Telescope mappings
if syst == 'conti' then
	map('n', '<Space><Space>', ":Telescope find_files cwd=D:/docs/<CR>", {noremap=true})
elseif syst == 'lin' then
	map('n', '<Space><Space>', ":Telescope find_files cwd=/home/salatiel/<CR>", {noremap=true})
end
map('n', '<Space>hh', ":Telescope find_files<CR>", {noremap=true})
map('n', '<Space>co', ':Telescope find_files cwd=' .. initLua .. '<CR>', {noremap=true})
map('n', '<Space>ft', ":Telescope find_files cwd=" .. initLua .. 'ftplugin/<CR>', {noremap=true})
map('n', '<Space>gh', ":Telescope grep_string search=-\\ [\\ ]<CR>", {noremap=true})
map('n', '<Space>ht', ":Telescope help_tags<CR>", {noremap=true})
