iabbrev <buffer> etal \textit{et. al.}
iabbrev <buffer> quad \qquad
iabbrev <buffer> nonumb \nonumber
iabbrev <buffer> noindent \noindent
iabbrev <buffer> item \item
iabbrev <buffer> vth $V_{th}$
" setlocal guioptions=!vAfcgt
setlocal indentexpr=
" setlocal spell spelllang=es_mx
syntax sync fromstart
setlocal iskeyword+=:
command! -nargs=1 -complete=file PdfShrink :!pdfShrink %:t:r.pdf <args>
inoremap <C-z> <Esc>[s1z=`]a
nnoremap <buffer> <Leader>lo :tabnew ~/.config/nvim/ftplugin/tex.vim<CR>
nnoremap <buffer> <Leader>lr :so ~/.config/nvim/ftplugin/tex.vim<CR>
nnoremap <buffer> <S-F6> :syntax sync fromstart<CR>
nnoremap <buffer> <silent> <F4> :py3 import hslib as hs; hs.cleanTex()<CR>
" section jumping
noremap <buffer> <silent> ]] :<c-u>call TexJump2Section( v:count1, '' )<CR>
noremap <buffer> <silent> [[ :<c-u>call TexJump2Section( v:count1, 'b' )<CR>
noremap <buffer> <silent> ]f :<c-u>call TexJump2Frame( v:count1, '' )<CR>
noremap <buffer> <silent> [f :<c-u>call TexJump2Frame( v:count1, 'b' )<CR>
function! TexJump2Section( cnt, dir )
	let i = 0
	let pat = '^\s*\\\(part\|chapter\|\(sub\)*section\|paragraph\)\>\|\%$\|\%^'
	let flags = 'W' . a:dir
	while i < a:cnt && search( pat, flags ) > 0
	 let i = i+1
	endwhile
	let @/ = pat
endfunction
function! TexJump2Frame( cnt, dir )
	let i = 0
	let pat = '\\begin{frame}'
	let flags = 'W' . a:dir
	while i < a:cnt && search( pat, flags ) > 0
	 let i = i+1
	endwhile
	let @/ = pat
endfunction
" au BufEnter destratShort02.tex let g:Tex_BibtexFlavor = 'bibtex'
" Autopairs
let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':"'", '$':'$', '<':'>'}

function! CleanTex()
	!rm *.log
	!rm *.aux
	!rm *.fdb_latexmk
	!rm *.fls
	!rm *.out
	!rm *.synctex.gz
	echo "Removed temp files"
endfunction

" vimtex
let g:vimtex_compiler_progname = 'nvr'
let g:tex_conceal='abdmg'
let g:vimtex_compiler_method='latexmk'
let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'jobs',
        \ 'background' : 1,
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 0,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-shell-escape',
        \   '-interaction=nonstopmode',
        \ ],
        \}

let g:vimtex_complete_enabled=1
let g:vimtex_imaps_enabled=0
let g:vimtex_indent_enabled=0
" let g:vimtex_view_method='zathura'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let g:vimtex_view_general_options_latexmk = '-reuse-instance'
" let b:vimtex_main = 'tesisMain.tex'
let g:vimtex_quickfix_mode=2
let g:vimtex_grammar_textidote={'jar': '~/.config/nvim/plugged/vimtex/textidote.jar'}
" En Sumatra: "C:\Program Files\Vim\vim82\gvim.exe" --remote-silent +%l %f
" En arch se debe instalar nvr como pip3 install --user --upgrade
" neovim-remote y agregar nvr --remote-silent +%l %f en las opciones de editor
" de okular
