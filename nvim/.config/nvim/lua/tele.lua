local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require('telescope.actions')
local actions_state = require('telescope.actions.state')

local external_open = function (prompt_bufnr)
    local selected_entry = actions_state.get_selected_entry()
	cmd('!start "" ' .. selected_entry[1])
	actions.close(prompt_bufnr)
end

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
	},
	pickers = {
		find_files = {
			attach_mappings = function(_, map)
				map("n", "<C-CR>", external_open)
				map("i", "<C-CR>", external_open)
				return true
			end,
		}
	}
}

map('n', '<Space><Space>', ":Telescope find_files<CR>", {noremap=true})
map('n', '<Space>co', ':Telescope find_files cwd=' .. initLua .. '<CR>', {noremap=true})
map('n', '<Space>ft', ":Telescope find_files cwd=" .. initLua .. 'ftplugin/<CR>', {noremap=true})
map('n', '<Space>td', ":Telescope grep_string search=-\\ (\\ )<CR>", {noremap=true})
map('n', '<Space>ht', ":Telescope help_tags<CR>", {noremap=true})
map('n', '<Space>lg', ":Telescope live_grep<CR>", {noremap=true})
