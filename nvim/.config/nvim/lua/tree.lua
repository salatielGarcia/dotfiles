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
			print(path)
			-- macOs: open file in default application in the background.
			cmd('!start "" ' .. path)
			-- Linux: open file in default application
			-- vim.api.nvim_command("silent !xdg-open " .. path)
			end,
		},
	},
})


map('n', '<Leader>T', ":Neotree toggle<CR>", {noremap=true})
