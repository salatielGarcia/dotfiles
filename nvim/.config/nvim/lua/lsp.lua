local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok, mlspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

local status_ok, mdap = pcall(require, "mason-nvim-dap")
if not status_ok then
    return
end

local status_ok, dap = pcall(require, "dap")
if not status_ok then
    return
end

local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
    return
end
----------
-- LUA
----------
lspconfig.lua_ls.setup {
	settings = {
		Lua = {
		runtime = {
			-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
			version = 'LuaJIT',
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = {'vim'},
		},
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = vim.api.nvim_get_runtime_file("", true),
		},
		-- Do not send telemetry data containing a randomized but unique identifier
		telemetry = {
			enable = false,
			},
		},
	},
}

----------
-- Python
----------
lspconfig.pyright.setup{
    on_attach = on_attach,
    flags = lsp_flags,
	settings = {
		pyright = {
			plugins = {
				pycodestyle = {enabled = false},
				pylint = { enabled = false},
			}
		}
	}
}


----------
-- Mason
----------

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

dapui.setup()

mdap.setup()
dap.configurations.python = {
	{
		type = 'python';
		request = 'launch';
		name = "Launch file";
		program = "${file}";
		pythonPath = function()
			return '/usr/bin/python'
		end;
	},
}

dap.adapters.python = {
	type = 'executable',
	-- command = 'C:\\Users\\uie84799\\scoop\\apps\\python\\current\\python.exe',
	command = 'python',
	args = { '-m', "debugpy.adapter" },
}

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set('n', '<Leader>du', function() dapui.open() end)
vim.keymap.set('n', '<Leader>dc', function() dapui.close() end)


-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
-- 	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
-- 	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
-- --
-- 	--Enable completion triggered by <c-x><c-o>
-- 	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- --
-- 	-- Mappings.
-- 	local opts = { noremap=true, silent=true }
-- --
-- 	-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- 	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- 	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- 	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- 	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- 	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- 	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- 	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- 	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- 	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- 	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- 	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- 	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- 	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- 	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- 	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- 	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- end
