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
" setlocal autochdir
" setlocal nosmarttab
" setlocal conceallevel=1
" let g:Tex_BibtexFlavor = 'biber'
" let g:Tex_BibtexFlavor = 'bibtex'
" set noautochdir
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

" vim latex
" let g:Imap_FreezeImap = 1
" let g:Tex_UsePython = 1
" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_MultipleCompileFormats = 'pdf, aux'
" let g:Tex_ViewRule_format = "SumatraPDF"
" let g:tex_flavor='latex'
" " let g:Tex_BibtexFlavor = 'biber'
" " let g:Tex_BibtexFlavor = 'bibtex'
" let g:Tex_DefaultTargetFormat = 'pdf'
" " let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -shell-escape -interaction=nonstopmode $*'
" let g:Tex_CompileRule_pdf = 'latexmk -pdf -latexoption="-synctex=1 -shell-escape -interaction=nonstopmode" -pv $*'
" let g:Tex_ViewRule_pdf = 'SumatraPDF -reuse-instance'
" let g:Tex_IgnoreLevel=0
" let g:Tex_GotoError=0
" let g:Tex_FoldedSections=''
" let g:Tex_EnvLabelprefix_figure = "fig:"
" let g:Tex_EnvLabelprefix_equation = "eq:"
" let g:Tex_EnvLabelprefix_table = "tab:"
" let g:Tex_EnvLabelprefix_align = "eq:"
" En sumatra:= "C:\Program Files\Vim\vim81\gvim.exe" -c ":RemoteOpen +%l %f"
" " Tex-fold
" let g:tex_fold_override_foldtext = 0
"
" vimtex
" let g:vimtex_quickfix_method='pplatex'
" let g:vimtex_quickfix_method='pulp'
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

" let g:vimtex_compiler_latexmk_engines = {
"     \ '_'                : '-pdf',
"     \ 'pdflatex'         : '-pdf',
"     \ 'dvipdfex'         : '-pdfdvi',
"     \ 'lualatex'         : '-lualatex',
"     \ 'xelatex'          : '-xelatex',
"     \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
"     \ 'context (luatex)' : '-pdf -pdflatex=context',
"     \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
"     \}
" Deprecated option
" let g:vimtex_quickfix_latexlog = {
"           \ 'default' : 1,
"           \ 'ignore_filters' : [],
"           \ 'general' : 1,
"           \ 'references' : 0,
"           \ 'overfull' : 1,
"           \ 'underfull' : 0,
"           \ 'font' : 1,
"           \ 'packages' : {
"           \   'default' : 1,
"           \   'general' : 1,
"           \   'babel' : 1,
"           \   'biblatex' : 1,
"           \   'fixltx2e' : 1,
"           \   'hyperref' : 1,
"           \   'natbib' : 1,
"           \   'scrreprt' : 1,
"           \   'titlesec' : 1,
"           \ },
"           \}

let g:vimtex_complete_enabled=1
let g:vimtex_imaps_enabled=0
let g:vimtex_indent_enabled=0
" let g:vimtex_view_method='zathura'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let g:vimtex_view_general_options_latexmk = '-reuse-instance'
" let g:vimtex_view_general_options
"     \ = '-reuse-instance -forward-search @tex @line @pdf'
"     \ . ' -inverse-search "gvim --servername ' . v:servername
"     \ . ' --remote-send \"^<C-\^>^<C-n^>'
"     \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
"     \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
"     \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
"     \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
" let b:vimtex_main = 'tesisMain.tex'
let g:vimtex_quickfix_mode=2
let g:vimtex_grammar_textidote={'jar': '~/.config/nvim/plugged/vimtex/textidote.jar'}
" En Sumatra: "C:\Program Files\Vim\vim82\gvim.exe" --remote-silent +%l %f
" En arch se debe instalar nvr como pip3 install --user --upgrade
" neovim-remote y agregar nvr --remote-silent +%l %f en las opciones de editor
" de okular