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
					work = "~/documents/notes/reas/",
                    personal = "~/documents/notes/pers/",
                }
            }
        },
		['core.gtd.base'] = {
			config = {
				workspace = "work"
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
map('n', '<Leader>oo', ':NeorgStart<CR>', {noremap = true})
-- map('n', '<Leader>or', ':Neorg workspace work<CR>', {noremap = true})
-- map('n', '<Leader>op', ':Neorg workspace personal<CR>', {noremap = true})
-- map('n', '<Leader>og', ':Neorg gtd ', {noremap = true})
-- map('n', '<Space>gw', ":Telescope live_grep cwd=D:/docs/wiki<CR>", {noremap=true})
-- map('n', '<Space>ww', ":Telescope find_files cwd=D:/docs/wiki<CR>", {noremap=true})
