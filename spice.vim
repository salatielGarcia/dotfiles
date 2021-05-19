" setlocal guioptions=vAfcgt
setlocal foldmethod=manual
nnoremap <Leader>lo <Esc>:tabnew ~/.config/nvim/ftplugin/spice.vim<CR>
nnoremap <Leader>lr <Esc>:so ~/.config/nvim/ftplugin/spice.vim<CR>

function! LoadSpice()
    FloatermToggle
    FloatermSend ngspice
endfunction

function! RunSpice()
    FloatermSend clear
    FloatermSend %
    FloatermToggle
endfunction

nnoremap <buffer> <Leader>sl <Esc>:call LoadSpice()<CR>
nnoremap <buffer> <Leader>ss <Esc>:call RunSpice()<CR>

" setlocal autochdir
" inoremap <buffer> <F5> <Esc>:!hspice.exe -mt 4 -hpp -i % -o  %:t:r.lis <CR> :vimgrep /\(error\\|warning\)/j *.lis<CR>:cl<CR>
" nnoremap <buffer> <F5> :!hspice.exe -mt 4 -hpp -i % -o  %:t:r.lis <CR> :vimgrep /\(error\\|warning\)/j *.lis<CR>:cl<CR>
" nnoremap <buffer> <S-F5> :!cscope.exe -pfiles %:t:r.
" nnoremap <buffer> <F4> :py3 import hslib as hs; hs.cleanHs()<CR>
" nnoremap <buffer> <F6> :vimgrep /\(error\\|warning\)/j *.lis<CR>:cl<CR>
" nnoremap <buffer> <Leader>mt :vimgrep /\<\(temper\>\)\@!\k\+\s=\s*\d*/j *.mt*<CR>:cl<CR>
" nnoremap <buffer> <Leader>mh :vimgrep /\<\(temper\>\)\@!\k\+\s=\s*\d*/j *.mb*<CR>:cl<CR>
" noremap <buffer> <silent> ]] :<c-u>call TexJump2Section( v:count1, '' )<CR>
" noremap <buffer> <silent> [[ :<c-u>call TexJump2Section( v:count1, 'b' )<CR>
function! TexJump2Section( cnt, dir )
	let i = 0
	let pat = '\.\(opt\|inc\|param\|op\|dc\|tr\|ac\|hb\)'
	let flags = 'W' . a:dir
	while i < a:cnt && search( pat, flags ) > 0
	 let i = i+1
	endwhile
	let @/ = pat
endfunction
