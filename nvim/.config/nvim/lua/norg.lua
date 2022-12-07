local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	print("Norg error")
    return
end

neorg.setup({
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
					reas = "~/docs/notes/reas/",
                    pers = "~/docs/notes/pers/",
                    conti = "~/docs/notes/conti/",
                }
            }
        },
		['core.gtd.base'] = {
			config = {
				workspace = "reas"
			}
		},
		['core.norg.concealer'] = {
		    config = {
		        conceal = false,
		        adaptive = false,
		    },
		},
		["core.export"] = {
			config = { -- Note that this table is optional and doesn't need to be provided
				export_dir = "<export-dir>/<language>-export",
		   }
		},
    }
})

-- Neorg mappings
-- map('n', '<Leader>oo', ':NeorgStart<CR>', {noremap = true})
map('n', '<Leader>or', ':Neorg workspace reas<CR>', {noremap = true})
map('n', '<Leader>op', ':Neorg workspace pers<CR>', {noremap = true})
map('n', '<Leader>oc', ':Neorg workspace conti<CR>', {noremap = true})
-- map('n', '<Leader>op', ':Neorg workspace personal<CR>', {noremap = true})
-- map('n', '<Leader>og', ':Neorg gtd ', {noremap = true})
-- map('n', '<Space>gw', ":Telescope live_grep cwd=D:/docs/wiki<CR>", {noremap=true})
-- map('n', '<Space>ww', ":Telescope find_files cwd=D:/docs/wiki<CR>", {noremap=true})
