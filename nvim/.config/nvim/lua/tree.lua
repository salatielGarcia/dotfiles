local status_ok, ntree = pcall(require, "neo-tree")
if not status_ok then
    return
end

ntree.setup({
	filesystem = {
		window = {
			mappings = {
				["<C-CR>"] = "system_open",
			},
		},
		commands = {
			system_open = function(state)
			local node = state.tree:get_node()
			local path = node:get_id()
			path = vim.fn.shellescape(path, 1)
			if vim.fn.has('win64') ~= 0 then
				cmd('!start "" ' .. selected_entry[1])
			elseif vim.fn.has('linux') ~= 0 then
				cmd('!xdg-open ' .. selected_entry[1])
			end
			end,
		},
	},
})


map('n', '<Leader>T', ":Neotree toggle<CR>", {noremap=true})
