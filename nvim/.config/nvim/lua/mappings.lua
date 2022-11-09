-- Spelling
_G.ChangeSpell = function()
	if spellChoice == "nil" then
		vim.cmd "silent setlocal spell spelllang=es_mx"
		spellChoice = "esp"
	elseif spellChoice == "esp"	then
		vim.cmd "silent setlocal spell spelllang=en_us"
		spellChoice = "eng"
	elseif spellChoice == "eng"	then
		vim.cmd "silent setlocal nospell"
		spellChoice = "nil"
	end
end
map('n', '<F3>', '"=strftime("%d %b %Y %H:%M %p")<CR>p', {noremap=true})
map('i', '<F3>', '<C-R>=strftime("%d %b %Y %H:%M %p")<CR>', {noremap=true})
map('n', '<F1>', ':tab h ', {noremap = true})
map('n', '<F9>', ':set rnu!<CR>', {noremap = true})
map("n", "<F6>", ":silent call v:lua.ChangeSpell()<CR>", {expr = false, noremap=true})
--
map('n', ',', ':', {noremap = true})
map('v', ',', ':', {noremap = true})
map('n', ':', ';', {noremap = true})
map('n', ';', ',', {noremap = true})
map('n', '<Esc><Esc>', ':nohl<CR>', {noremap = true})
map('n', 'k', 'gk', {noremap = true})
map('n', 'j', 'gj', {noremap = true})
map('i', '<Up>', '<C-o>gk', {noremap = true})
map('i', '<Down>', '<C-o>gj', {noremap = true})
--
map('n', '<Leader>co', '<Esc>:tabnew ' .. initLua .. 'init.lua' .. '<CR>', {noremap = true})
map('n', '<Leader>cr', '<Esc>:so ' .. initLua .. 'init.lua' .. '<CR>', {noremap = true})
map('n', '<Leader>po', '<Esc>:tabnew ' .. plugs .. '<CR>', {noremap = true})
map('n', '<Leader>cd', '<Esc>:lcd %:p:h <CR>', {noremap = true})
map('n', '<Leader>na', '<Esc>/[^\\x00-\\x7F] <CR>', {noremap = true})
--
--Temp mapings
map('n', '<Leader>el', '<Esc>:e ~/software/extFiles.nvim/lua/extFiles.lua<CR>', {noremap = true})
-- " move between windows
map('n', '<Leader>j', '<C-W><C-J>', {noremap = true})
map('n', '<Leader>k', '<C-W><C-K>', {noremap = true})
map('n', '<Leader>l', '<C-W><C-L>', {noremap = true})
map('n', '<Leader>h', '<C-W><C-H>', {noremap = true})
--
map('n', '<Leader>ta', '<Esc>:tabnew **/*', {noremap = true})
map('n', '<Leader>tn', '<Esc>:tabnew ', {noremap = true})
--
map('n', '<Leader>k', 'gk', {noremap = true, silent=true})
map('n', '<Leader>j', 'gj', {noremap = true, silent=true})
--
map('n', '<C-k>', '3<C-y>', {noremap = true})
map('n', '<C-j>', '3<C-e>', {noremap = true})
--
map('n', '>', '>>', {noremap = true})
map('n', '<', '<<', {noremap = true})
map('n', 'Y', 'y$', {noremap=true})
--
-- Source lua configs
map('n', '<Leader>ln', ':so %<CR>', {noremap = true})
--map('t', '<F12>', '<C-\><C-n>:', {noremap = true})

-- extFiles Mappings
map('n', '<Leader><Leader>e', ':lua require("extFiles").ext_file()<CR>', {noremap = true})
--
-- Text Centering
map('n', '{', '{zzzv', {noremap=true})
map('n', '}', '}zzzv', {noremap=true})
map('n', 'n', 'nzzzv', {noremap=true})
map('n', 'N', 'Nzzzv', {noremap=true})
map('n', 'J', 'mzJ`z', {noremap=true})
--
-- Break undo
map('i', ',', ',<C-g>u', {noremap=true})
map('i', '.', '.<C-g>u', {noremap=true})
map('i', '!', '!<C-g>u', {noremap=true})
map('i', '?', '?<C-g>u', {noremap=true})
