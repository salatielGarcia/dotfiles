local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	print("Norg error")
    return
end

neorg.setup{
	load = {
		["core.defaults"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					reas = '~/Documents/notes/reas/',
					pers = '~/Documents/notes/pers/',
					conti = '~/Documents/notes/conti/',
				},
				index = 'index.norg'
			}
		},
		['core.concealer'] = {
		    config = {
				conceal = true,
				adaptive = true,
		    },
		},
		['core.itero'] = {},
		-- ["core.export"] = {
		-- 	config = { -- Note that this table is optional and doesn't need to be provided
		-- 		export_dir = "<export-dir>/<language>-export",
		--    }
		-- },
	}
}

-- Neorg mappings
-- map('n', '<Leader>oo', ':NeorgStart<CR>', {noremap = true})
map('n', '<Leader>oi', ':Neorg index<CR><CR>', {noremap = true})
map('n', '<Leader>or', ':Neorg workspace reas<CR><CR>', {noremap = true})
map('n', '<Leader>op', ':Neorg workspace pers<CR><CR>', {noremap = true})
map('n', '<Leader>oc', ':Neorg workspace conti<CR><CR>', {noremap = true})
-- map('n', '<Leader>op', ':Neorg workspace personal<CR>', {noremap = true})
-- map('n', '<Leader>og', ':Neorg gtd ', {noremap = true})
-- map('n', '<Space>gw', ":Telescope live_grep cwd=D:/docs/wiki<CR>", {noremap=true})
-- map('n', '<Space>ww', ":Telescope find_files cwd=D:/docs/wiki<CR>", {noremap=true})
