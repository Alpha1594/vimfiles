" SnipMate"{{{
	let g:snips_author = 'Andrew Stanton' " Setting the author var
"}}}
" NerdTree"{{{
    let NERDTreeMinimalUI=1		"Removes fluff from GUI
	let NERDTreeShowBookmarks=1
	let NERDTreeMouseMode=2
	let NERDTreeIgnore=['\.pyc', '\.pyo', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.mp3$', '\.ini$', '\.aif$']
	let NERDTreeIgnore+=['\.Designer.cs$', '\.resx$', '\.ico$', '\.csproj']
	let NERDTreeIgnore+=['\.aux$', '\.bbl$', '\.blg$', '\.lof$', '\.log$', '\.out$', '\.toc$']
	" let NERDTreeQuitOnOpen=1	"Will close NERDTree once file is opened
	let NERDTreeShowHidden=1
	let NERDTreeSortOrder=['\/$','\.vim$', '\.cs$', '*', '\.swp$', '\.bak$', '\~$']
	let NERDTreeWinPos="right"
	" let NERDTreeChDirMode=1
	" let NERDTreeKeepTreeInNewTab=1	"Does not revert to base directory
	" let g:nerdtree_tabs_open_on_gui_startup=1
	" let g:nerdtree_tabs_smart_startup_focus = 1
	" let g:nerdtree_tabs_focus_on_files = 1
	let g:NERDTreeWinSize = 40
	" autocmd VimEnter * if !argc() | NERDTree Start | endif
"}}}
" Colorizer"{{{
	let g:colorizer_auto_filetype='css,html,vim'
	let g:colorizer_skip_comments = 1
	let g:colorizer_nomap = 1
"}}}
" solarized"{{{
	let g:solarized_termcolors= 256
	color solarized                 " Load a colorscheme
	let g:solarized_termtrans= 1
	let g:solarized_contrast= "high"
	let g:solarized_visibility= "high"
	let g:solarized_italic    = 0
	let g:solarized_style     = "dark"
	set background=dark
"}}}
"delimitMate "{{{
	let delimitMate_balance_matchpairs = 1
	let delimitMate_nesting_quotes = ['"','`']
	" let delimitMate_excluded_regions = "Comment,String,Todo"
"}}}
" Ozzy"{{{
	let g:ozzy_root_markers = ['.git', '.hg', '.svn', 'AndroidManifest.xml', '.sln']
"}}}
"airline"{{{
" let g:airline_enable_fugitive=1
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
"}}}
"syntastic{{{
    let g:syntastic_check_on_open=1
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_filetype_map = { 'latex': 'tex'}
    let g:syntastic_mode_map = { 'mode': 'active'}
    let g:syntastic_cs_checkers = ['mcs']
    let g:syntastic_python_checkers = ['flake8']
"}}}
"MiniBufExpl{{{
let g:miniBufExplMaxSize = 10
" let g:miniBufExplorerAutoStart = 0
let g:miniBufExplHideWhenDiff = 1
let g:miniBufExplCycleArround = 1
"}}}
"Hardtime{{{
let g:hardtime_default_on = 1
let g:hardtime_timeout=5
let g:list_of_normal_keys = [ "h", "j", "k", "l", "-", "+"]
"}}}
" Tagbar {{{
	let g:tagbar_compact = 1
	let g:tagbar_autoshowtag = 1
	autocmd BufWinEnter,WinEnter "__Tagbar__" :setlocal nonumber
"}}}


"CS tweaks{{{
	au FileType cs set omnifunc=syntaxcomplete#Complete
	au FileType cs setlocal foldmethod=marker
	au FileType cs setlocal foldmarker={,}
	au FileType cs setlocal foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
	" au FileType cs setlocal foldlevelstart=2

	au FileType cs setlocal makeprg=C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe\ /nologo\ /v:q\ /property:GenerateFullPaths=true
	au FileType cs setlocal errorformat=\ %#%f(%l\\\,%c):\ %m

	function! Uppity()
		lcd %:p:h
		lcd ..
		pwd
	endfunc

	au BufEnter *.cs call Uppity()
"}}}
"Tex Tweaks"{{{
set conceallevel=2
let g:tex_conceal="adgm"
" syn match texGreek '\\eps\>' contained conceal cchar=ε
" syn match texMathSymbol '\\arr\>' contained conceal cchar=←
"}}}
