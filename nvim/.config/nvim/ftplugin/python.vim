setlocal foldmethod=indent
" inoremap <F5> <Esc>:w<CR>:py3file % <CR>
" nnoremap <F5> :w<CR>:py3file % <CR>
" inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
" nnoremap <buffer> <F5> :w<CR>:!python %<CR>
compiler pyunit
setlocal makeprg=python\ %

nnoremap <buffer> <Leader>lo :tabnew ~/.config/nvim/ftplugin/python.vim<CR>
nnoremap <buffer> <Leader>lr :so ~/.config/nvim/ftplugin/python.vim<CR>
nnoremap <buffer> <Leader>pp :make!<CR>

setlocal completeopt-=preview
