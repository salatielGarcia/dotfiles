setlocal makeprg=lua\ %

nnoremap <buffer> <Leader>lo :tabnew ~/.config/nvim/ftplugin/python.vim<CR>
nnoremap <buffer> <Leader>lr :so ~/.config/nvim/ftplugin/python.vim<CR>
nnoremap <buffer> <Leader>ll :make!<CR>

setlocal completeopt-=preview
