set makeprg=ghc\ -dynamic\ %

" nnoremap <buffer> <Leader>hh :!ghc -dynamic %<CR>
nnoremap <buffer> <Leader>hh :make<CR>
nnoremap <buffer> <Leader>hr :!./%:r<CR>
nnoremap <buffer> <Leader>hc :so ~/.config/nvim/ftplugin/haskell.vim<CR>
