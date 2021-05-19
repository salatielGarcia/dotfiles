" set makeprg=gcc\ -Wall\ -Werror\ -Wextra\ %\ -o\ %:t:r
set makeprg=g++\ -x\ c++\ -std=c++14\ -O2\ -o\ %:t:r\ %

let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':"'", '<':'>'}
nnoremap <buffer> <Leader>lo :tabnew ~/.config/nvim/ftplugin/cpp.vim<CR>
nnoremap <buffer> <Leader>lr :source ~/.config/nvim/ftplugin/cpp.vim<CR>
nnoremap <buffer> <Leader>ll :make<CR>
nnoremap <buffer> <Leader>lv :!./%:t:r<CR>


