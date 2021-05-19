nnoremap <buffer> <Leader>lr :so ~/.config/nvim/ftplugin/matlab.vim<CR>
nnoremap <buffer> <Leader>lo :tabnew ~/.config/nvim/ftplugin/matlab.vim<CR>
nnoremap <buffer> <Leader>mo <Esc>:FloatermSend --name=1 matlab -nodesktop -nosplash<CR>


function! LoadMatlab()
    FloatermToggle
    FloatermSend --name=1 matlab -nodesktop -nosplash
endfunction

" function! SendToMatlab()
"     %SlimeSend
"     FloatermToggle
" endfunction


function! SendToMatlab()
    FloatermSend %:t:r
    FloatermToggle
endfunction

nnoremap <buffer> <Leader>ms :call LoadMatlab()<CR>
nnoremap <buffer> <Leader>mm :call SendToMatlab()<CR>
