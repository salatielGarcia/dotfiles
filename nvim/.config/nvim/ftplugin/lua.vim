setlocal makeprg=lua\ %

nnoremap <buffer> <Leader>lo :tabnew ~/.config/nvim/ftplugin/lua.vim<CR>
nnoremap <buffer> <Leader>lr :so ~/.config/nvim/ftplugin/lua.vim<CR>
nnoremap <buffer> <Leader>ll :make!<CR>
nnoremap <buffer> <Leader>so :source %<CR>

setlocal completeopt-=preview
