call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-sandwich'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'machakann/vim-highlightedyank'
call plug#end()
" ======================================================================================
"                                 Plugins Configuration 
" ======================================================================================

" Onedark
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
"
" ultisnips:
let g:pymode_python = 'python3'
let g:UltiSnipsSnippetDirectories=['~/Documents/notes/snips']
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit = 'tabdo'
"
" nedCommenter:
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
" let g:NERDAltDelims_java = 1
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1
"
" lightline
function! Apath()
	return fnamemodify(getcwd(), ":~")
	" return getcwd()
endfunction
 function! CloseSymbol()
	 return '  '
 endfunction
let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ 'component_function': {
		 \ 'absolutepath': 'Apath',
		 \ 'close': 'CloseSymbol',
	  \ }
	\ }
"       ⏽   ﱢ               BitstreamVera
"let g:lightline.separator = { 'left': '⮀', 'right': '⮂' }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.active = {
	\ 'left': [ [ 'mode','spell','paste'],
	\           [ 'readonly', 'absolutepath'] ],
	\ 'right': [ [ 'lineinfo'],
	\            ['percent'],
	\            [ 'filetype'], ] }
let g:lightline.inactive = {
	\ 'left': [ [ 'filename' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ] ] }
let g:lightline.tabline = {
	\ 'left': [ [ 'tabs' ] ],
	\ 'right': [ [ 'close' ] ]}
" let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_separator = { 'left': '', 'right': '' }
" let g:lightline.tabline_subseparator = { 'left': '⮁', 'right': '⮃' }
let g:lightline.tabline_subseparator = { 'left': '│', 'right': '│' }
function! MyFiletype()
 return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
"
" autopairs
" let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
"
" Goyo, distraction free mode
let g:goyo_width=140
let g:goyo_height=100
let g:goyo_linenr=4
"
" Supertab
function DictContext()
  if filereadable(expand('%:p:h') . '/tags')
	return "\<c-x>\<c-k>"
  endif
  " no return will result in the evaluation of the next
  " configured context
endfunction
let g:SuperTabCompletionContexts =
	\ ['s:ContextText', 's:ContextDiscover', 'DictContext']
"
" Startify
let g:startify_bookmarks = [ {'c': '~/AppData/Local/nvim/init.vim'}, 
			\ {'y':'C:/Users/salatiel/Documents/dmt/yolikan/AtmelStudio/YolikanPCBFirm/YolikanPCBFirm/YolikanPCBFirm/Sketch.cpp'}, 
			\ {'g':'C:/Users/salatiel/Documents/dmt/genNotes.md'}, 
			\ {'a':'C:/Users/salatiel/Documents/dmt/yolikan/AtmelStudio/notasAS.md'}, 
			\ {'p':'C:/Users/salatiel/Documents/dmt/yolikan/AtmelStudio/batchProgramming/parallelProgram.cmd'}]
let g:startify_lists = [{ 'type': 'files',     'header': ['   MRU']}, { 'type': 'bookmarks', 'header': ['   Bookmarks']}, { 'type': 'commands',  'header': ['   Commands']}]
"
" FZF
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
" let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"
" YankStack
let g:yankstack_map_keys = 0
nmap <A-a> <Plug>yankstack_substitute_older_paste
nmap <A-A> <Plug>yankstack_substitute_newer_paste
"
" =============================================================================
"                                 Basic Config 
" =============================================================================

set shellslash
set path+=**
filetype plugin on    " required
filetype indent on
set nocompatible
syntax enable
set laststatus=2
set showtabline=2
set viewoptions=cursor,folds,slash,unix
set linespace=2
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif
set guioptions=!vAfcgt
set guifont=mononoki\ Nerd\ Font\ Mono\ 12
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"
colorscheme onedark
" hi Comment guifg=#6F7A91
hi Normal ctermbg=NONE guibg=NONE
hi Nontext ctermbg=NONE guibg=NONE
" set timeoutlen=0
" HL Yank
highlight HighlightedyankRegion guibg=#282c34 guifg=#56b6c2
set nu
set rnu
set ruler
set hlsearch
set ignorecase
set tabstop=4
set softtabstop=-1 shiftwidth=0
set smarttab
set incsearch
set showcmd
set cursorline
set mouse=a
set backspace=2
set backspace=indent,eol,start
set complete+=kspell
set splitright
set splitbelow
" Indent linebreaks
set breakindent
set autoindent
" System commands
set autoread 
set autowrite
set autochdir
set wildmenu
set wildmode=list:full
set wrap linebreak
" set colorcolumn=80
set clipboard=unnamed
" set sessionoptions="buffers,curdir,folds,localoptions,options,slash,tabpages,terminal"
" set encoding=utf-8
" set fileencoding=utf-8
"
" reduce priority of searches
set suffixes= ".bak,~,.o,.h,.info,.swp,.obj,.lis, .mt0, .ac0, .mb0, .st0, .sw0, .s2p, .ic0, .hr0, .mr0, .ms0, .dp0, .ma0, .sc0, .html, .tr0, .hb0, .printhb0, .printtr0, .printsw0, .printac0, .pa0"
"
set encoding=utf-8                   
setglobal fileencoding=utf-8        
" endif
"
if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
"
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
"
" Improve memory used for spelling
syn sync maxlines=40000
syn sync minlines=1000
"
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= '['.v:lnum.'] '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label " . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}
"
" Restore window size and position
" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1
"
" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1
"
if has("gui_running")
	function! ScreenFilename()
	if has('amiga')
		return "s:.vimsize"
	elseif has('win32')
		return $HOME.'\_vimsize'
	else
		return $HOME.'/.vimsize'
	endif
	endfunction
	"
	function! ScreenRestore()
	" Restore window size (columns and lines) and position
	" from values stored in vimsize file.
	" Must set font first so columns and lines are based on font size.
	let f = ScreenFilename()
	if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
		let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
		for line in readfile(f)
			let sizepos = split(line)
			if len(sizepos) == 5 && sizepos[0] == vim_instance
				silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
				silent! execute "winpos ".sizepos[3]." ".sizepos[4]
				return
			endif
		endfor
	endif
	endfunction
	"
	function! ScreenSave()
	" Save window size and position.
	if has("gui_running") && g:screen_size_restore_pos
		let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
		let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
			\ (getwinposx()<0?0:getwinposx()) . ' ' .
			\ (getwinposy()<0?0:getwinposy())
		let f = ScreenFilename()
		if filereadable(f)
			let lines = readfile(f)
			call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
			call add(lines, data)
		else
			let lines = [data]
		endif
		call writefile(lines, f)
	endif
	endfunction
	"
	if !exists('g:screen_size_restore_pos')
		let g:screen_size_restore_pos = 1
	endif
	if !exists('g:screen_size_by_vim_instance')
		let g:screen_size_by_vim_instance = 1
	endif
	autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
	autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif
"
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{noscrollbar#statusline()}
" ==================================================================================
"                                 Shortcut Mappings 
" ==================================================================================

" Insert time stamp
nmap <F3> i<C-R>=strftime("%a %d/%b/%Y, %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%a %d/%b/%Y, %I:%M %p")<CR>
"
" Help
nnoremap <F1> :tab h 
nnoremap <F9> :se rnu!<CR>
nnoremap <F12> :FloatermToggle<CR>
"
" Activate spellcheck
nmap <F6> :setlocal spell spelllang=
nmap <S-F6> :syntax sync fromstart <CR>
"
" Change default use of comma to :
nnoremap , :
vnoremap , :
nnoremap : ;
nnoremap ; ,
nnoremap ` '
nnoremap <Esc><Esc> :nohl<CR>
"
" Remember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"
" NERDTree on enter buffer
" autocmd vimenter * NERDTree
"
let mapleader='¿'
let maplocalleader='¿'
nnoremap <Leader>co <Esc>:tabnew /home/salatiel/.vimrc<CR>
nnoremap <Leader>do <Esc>:e ++ff=utf-8<CR>
nnoremap <Esc><Esc> <Esc>:nohl<CR>
"
" FZF shortcuts
nnoremap <Space><Space> <Esc>:Files ~/<CR>
nnoremap <Space>l <Esc>:BLines<CR>
nnoremap <Space>r <Esc>:Lines<CR>
"
" move between windows
noremap <A-Down> <C-W><C-J>
noremap <A-Up> <C-W><C-K>
noremap <A-Right> <C-W><C-L>
noremap <A-Left> <C-W><C-H>
"
" Split commands
nnoremap <Leader>ta <Esc>:tabnew **/*
nnoremap <Leader>tn <Esc>:tabnew 
"
"make wrapped lines more intuitive
noremap <silent> k gk
noremap <silent> j gj
" noremap <silent> 0 g0
" noremap <silent> $ g$
"
noremap <silent> <Up> gk
noremap <silent> <Down> gj
nnoremap <S-Up> 3<C-y>
nnoremap <S-Down> 3<C-e>
nmap <C-Up> <C-u>
nmap <C-Down> <C-d>
" nnoremap K <C-y>
" nnoremap J <C-e>
"
" Tabular commands
" set verbose=2
" vnoremap <Tab> >gv
" vnoremap <S-Tab> >gv
nnoremap < >>
nnoremap > <<
"
" Terminal mapping
tnoremap <F12> <C-\><C-n>:FloatermToggle<CR>
"
" =============================================================================
"                                 Autocommands 
" =============================================================================

" au VimEnter *
" au BufEnter,FileType *.sage set filetype=sage
au BufReadPost *.sage set filetype=sage
au BufEnter,BufNew vifmrc set filetype=vim
nnoremap <Leader>S :call TrashFunc()<CR>
function! TrashFunc()
	tabnew
	Startify
endfunction
nnoremap <Leader>xc :cd %:p:h<CR>
" File completition
" inoremap <C-f> <C-x><C-f>
" cd C:\Users\angel\Documents\cidesi\PhD
" se nofoldenable
" set listchars=tab:>_,nbsp:_,trail:·
" set lis
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
