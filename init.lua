
--
initLua = '~/.config/nvim/init.lua'
plugs = '~/.config/nvim/lua/plugins.lua'
--
-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local highlight = vim.api.nvim_set_hl
g.mapleader = '¿'
g.maplocalleader = '¿'

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('plugins')
require('nvim-autopairs').setup()
require('commented').setup()
g.onedark_transparent_background = 1
require('onedark').setup()

cmd [[ 
hi Comment guifg=#6F7A91
hi Normal ctermbg=NONE guibg=NONE
hi Nontext ctermbg=NONE guibg=NONE
]]

local compe = require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	resolve_timeout = 800;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = {
	border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
	winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
	max_width = 120,
	min_width = 60,
	max_height = math.floor(vim.o.lines * 0.3),
	min_height = 1,
	};

	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		vsnip = false;
		ultisnips = true;
		luasnip = false;
	};
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
-- _G.tab_complete = function()
  -- if vim.fn.pumvisible() == 1 then
    -- return t "<C-n>"
  -- elseif vim.fn['vsnip#available'](1) == 1 then
    -- return t "<Plug>(vsnip-expand-or-jump)"
  -- elseif check_back_space() then
    -- return t "<Tab>"
  -- else
    -- return vim.fn['compe#complete']()
  -- end
-- end
-- _G.s_tab_complete = function()
  -- if vim.fn.pumvisible() == 1 then
    -- return t "<C-p>"
  -- elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    -- return t "<Plug>(vsnip-jump-prev)"
  -- else
    -- -- If <S-Tab> is not working in your terminal, change it to <C-h>
    -- return t "<S-Tab>"
  -- end
-- end
--

_G.tab_completion = function()
  if vim.fn.pumvisible() == 1 then
    return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)

  elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    return vim.api.nvim_replace_termcodes("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>", true, true, true)

  elseif is_prior_char_whitespace() then
    return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)

  else
    return vim.fn['compe#complete']()
  end
end
_G.shift_tab_completion = function()
  if vim.fn.pumvisible() == 1 then
    return vim.api.nvim_replace_termcodes("<C-p>", true, true, true)

  elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
    return vim.api.nvim_replace_termcodes("<C-R>=UltiSnips#JumpBackwards()<CR>", true, true, true)

  else
    return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
  end
end
map("i", "<Tab>", "v:lua.tab_completion()", {expr = true})
map("s", "<Tab>", "v:lua.tab_completion()", {expr = true})
map("i", "<S-Tab>", "v:lua.shift_tab_completion()", {expr = true})
map("s", "<S-Tab>", "v:lua.shift_tab_completion()", {expr = true})
map("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
map('i', '<C-e>', "compe#close('<End>')", {expr=true})

g.pymode_python = 'python3'
g.UltiSnipsSnippetDirectories = {'~/notes/snips/'}
g.UltiSnipsUsePythonVersion = 3
g.UltiSnipsExpandTrigger="<tab>"
g.UltiSnipsJumpForwardTrigger="<C-j>"
g.UltiSnipsJumpBackwardTrigger="<C-p>"
g.UltiSnipsEditSplit = 'tabdo'

local nvim_lsp = require('lspconfig')
require('lspinstall')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end
-- Your custom attach function for nvim-lspconfig goes here.
-- local custom_nvim_lspconfig_attach = function(...) end

-- -- To get builtin LSP running, do something like:
-- -- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
-- require('nlua.lsp.nvim').setup(require('lspconfig'), {
  -- on_attach = custom_nvim_lspconfig_attach,

  -- -- Include globals you want to tell the LSP are real :)
  -- globals = {
    -- -- Colorbuddy
    -- "Color", "c", "Group", "g", "s",
  -- }
-- })

require'lspconfig'.sumneko_lua.setup{
	-- cmd = {'~/lua-language-server/bin/Linux/lua-language-server -E ~/lua-language-server/main.lua'},
	cmd = {'sLuaLaunch'},
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
    },
	settings = {
		Lua = {
			runtime = {
			  version = 'LuaJIT',
			  path = {vim.split(package.path, ";")}
			},
			diagnostics = {
				enable = true,
				globals = {
					"vim",
					"describe",
					"it",
					"before_each",
					"after_each",
					"teardown",
					"pending",
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("~/repos/nvim/lua")] = true,
					}
				}
			}
		}
	}
}
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = {"lua-language-server"}
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end
require'lspconfig'.pyright.setup{}

local actions = require('telescope.actions')
require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter =  require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
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

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
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


opt.path = opt.path + '**'
opt.number = true
opt.relativenumber = true
opt.mouse ='a'
opt.termguicolors = true
opt.ignorecase = true
opt.tabstop = 4
opt.softtabstop = -1
opt.shiftwidth = 0
opt.swapfile = false
opt.backup = false
opt.undodir = '~/.config/nvim/undodir/'
opt.undofile = true
opt.cursorline = true
opt.clipboard = 'unnamedplus'
opt.complete = opt.complete + 'kspell'
opt.splitright = true
opt.splitbelow = true
opt.breakindent = true
opt.autowrite = true
-- opt.autochdir = true
-- opt.wildmode = 'longest:full'
opt.completeopt = "menuone,noselect"


if fn.has('autocmd') then
	cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]])
end

map('n', '<F1>', ':tab h ', {noremap = true})
map('n', '<F9>', ':set rnu!<CR>', {noremap = true})

map('n', ',', ':', {noremap = true})
map('v', ',', ':', {noremap = true})
map('n', ':', ';', {noremap = true})
map('n', ';', ',', {noremap = true})
map('n', '<Esc><Esc>', ':nohl<CR>', {noremap = true})

map('n', '<Leader>co', '<Esc>:tabnew ' .. initLua .. '<CR>', {noremap = true})
map('n', '<Leader>cr', '<Esc>:so ' .. initLua .. '<CR>', {noremap = true})
map('n', '<Leader>po', '<Esc>:tabnew ' .. plugs .. '<CR>', {noremap = true})
map('n', '<Leader>cd', '<Esc>:lcd %:p:h <CR>', {noremap = true})


-- " move between windows
map('n', '<C-A-j>', '<C-W><C-J>', {noremap = true})
map('n', '<C-A-k>', '<C-W><C-K>', {noremap = true})
map('n', '<C-A-l>', '<C-W><C-L>', {noremap = true})
map('n', '<C-A-h>', '<C-W><C-H>', {noremap = true})


map('n', '<Leader>ta', '<Esc>:tabnew **/*', {noremap = true})
map('n', '<Leader>tn', '<Esc>:tabnew ', {noremap = true})

map('n', '<Leader>k', 'gk', {noremap = true, silent=true})
map('n', '<Leader>j', 'gj', {noremap = true, silent=true})


map('n', '<C-k>', '3<C-y>', {noremap = true})
map('n', '<C-j>', '3<C-e>', {noremap = true})


map('n', '<', '>>', {noremap = true})
map('n', '>', '<<', {noremap = true})

map('n', '<Space><Space>', ":lua require'telescope.builtin'.find_files()<CR>", {noremap=true})

--map('t', '<F12>', '<C-\><C-n>:', {noremap = true})
