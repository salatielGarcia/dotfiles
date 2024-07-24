-- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

local status_ok, treesit = pcall(require, "nvim-treesitter")
if not status_ok then
	print('TS failed')
    return
end

-- require'nvim-treesitter.configs'.setup{}
require'nvim-treesitter.configs'.setup {
    -- ensure_installed = {
    --     -- "bash",
    --     -- "c",
    --     -- "cpp",
    --     -- "css",
    --     -- "fortran",
    --     -- "go",
    --     -- "html",
    --     -- "java",
    --     -- "json",
    --     -- "markdown",
    --     -- "latex",
    --     "lua",
    --     "norg",
    --     "norg_meta",
    --     "norg_table",
    --     "python",
    --     -- "yaml",
    -- },
    highlight = {
        enable = true,
		disable = {'markdown', 'tex', 'latex', 'vimdoc'},
    },
    indent = {
        enable = false
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gni",
            node_incremental = "gnn",
            scope_incremental = "gns",
            node_decremental = "gnd",
        },
    },
    refactor = {
        highlight_definitions = { enable = true },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition_lsp_fallback = "<c-]>",
                list_definitions = "gnD",
                goto_next_usage = "<C-*>",
                goto_previous_usage = "<C-#>",
            },
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grn",
            },
        },
    },
    -- textobjects = {
    --     select = {
    --         enable = true,
    --         keymaps = {
    --             -- You can use the capture groups defined in textobjects.scm
    --             ["af"] = "@function.outer",
    --             ["if"] = "@function.inner",
    --             ["ac"] = "@class.outer",
    --             ["ic"] = "@class.inner",
    --         },
    --     },
    -- },
}
