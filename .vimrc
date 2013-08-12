set nocompatible
let maplocalleader = "|"
" Use <localleader> in mappings
au WinEnter,VimEnter :echo ">^.^<"
set shellslash
set mousehide
set foldopen=block,insert,hor,mark,percent,quickfix,search,tag,undo
cd $HOME
" execute pathogen#infect()
" call pathogen#helptags()
let $CS = $HOME."\\Documents\\Visual Studio 2012\\Projects"
let $Dropbox = $HOME."\\Dropbox"
let $vimFiles = $HOME."\\vimfiles"
let $Bundle = $vimFiles."\\bundle"
if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

	" url = git@github.com:xolox/vim-easytags.git

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/color_highlight'
NeoBundle 'euclio/vim-nocturne'
NeoBundle 'fholgado/minibufexpl.vim'
" NeoBundle 'gcmt/ozzy.vim'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'xolox/vim-misc'
NeoBundleCheck

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,"{{{
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>"}}}

" When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
  augroup END

syntax on
filetype on             " try to set the filetype automatically
filetype plugin on      " try loading plugins automatically
filetype indent on      " indent

"OS Sensitive"{{{
if !has('gui')
	set term=$TERM          " Make arrow and other keys work
	set t_Co=256 "tell the term has 256 colors
endif

if !has("win32")
	set listchars+=tab:‣\ ,eol:⑊
	set showbreak=𐎗
	set undodir=~/.vim/tmp/undo//	 " undo files
	set backupdir=~/.vim/tmp/backup// " backups
	set directory=~/.vim/tmp/swap//   " swap files

	" Make those folders automatically if they don't already exist.
	if !isdirectory(expand(&undodir))
		call mkdir(expand(&undodir), "p")
	endif
	if !isdirectory(expand(&backupdir))
		call mkdir(expand(&backupdir), "p")
	endif
	if !isdirectory(expand(&directory))
		call mkdir(expand(&directory), "p")

	set shell=/bin/bash\ --login
	au FileType tex nmap <buffer><F2> :!pdflatex %<CR>
	endif
endif
"}}}

"Vimscripts"{{{
"Synstack {{{
" Show the stack of syntax hilighting classes affecting whatever
"is under the cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc
" }}}
" Highlight Word {{{
" This mini-plugin provides a few mappings for highlighting words temporarily.
" Now you can use <leader>N where N is a number from 1-6 to highlight the current word in a specific color.
" Default Highlights {{{
hi def InterestingWord0 guifg=#000000 ctermfg=16 guibg=#800080 ctermbg=13
hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
hi def InterestingWord7 guifg=#000000 ctermfg=16 guibg=#5fff00 ctermbg=82
hi def InterestingWord8 guifg=#000000 ctermfg=16 guibg=#ffaf00 ctermbg=214
hi def InterestingWord9 guifg=#000000 ctermfg=16 guibg=#0087ff ctermbg=33
" }}}
function! HiInterestingWord(n) " {{{
	" Save our location.
	normal! mz
	" Yank the current word into the z register.
	normal! "zyiw
	" Calculate an arbitrary match ID.  Hopefully nothing else is using it.
	let mid = 86750 + a:n
	" Clear existing matches, but don't worry if they don't exist.
	silent! call matchdelete(mid)
	" Construct a literal pattern that has to match at boundaries.
	let pat = '\V\<' . escape(@z, '\') . '\>'
	" Actually match the words.
	call matchadd("InterestingWord" . a:n, pat, 1, mid)
	" Move back to our original location.
	normal! `z
endfunction " }}}
" Mappings {{{
nnoremap <silent> <leader>0 :call HiInterestingWord(0)<cr>
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
nnoremap <silent> <leader>7 :call HiInterestingWord(7)<cr>
nnoremap <silent> <leader>8 :call HiInterestingWord(8)<cr>
nnoremap <silent> <leader>9 :call HiInterestingWord(9)<cr>
" }}}
" }}}
" Strip whitespace"{{{
function! StripTrailingWhitespace()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" do the business:
	%s/\s\+$//e
	" clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
"}}}
function! InsertStatuslineColor(mode)"{{{
  if a:mode == 'i'
    hi statusline guibg=#5f00af guifg=Black ctermfg=6 ctermbg=0
    echo "I"
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction"}}}
" }}}

iabbrev eml alpha1594@gmail.com
iabbrev @@ alpha1594@gmail.com
iabbrev teh the
iabbrev Voldemort The Dark Lord (Don't talk about Potter)
cabbrev ls ls!

"GUI Tweaks"{{{
au InsertLeave * hi statusline guibg=#303030 guifg=#666666  ctermfg=8 ctermbg=15

"define 3 custom highlight groups
 hi User1 guifg=#af0000    " ctermbg=green ctermfg=red   guibg=#000000"gui=bold
 hi User2   guifg=#5f00af  " ctermbg=red   ctermfg=blue  guibg=#000000
 hi User3  guifg=#00af00   " ctermbg=blue  ctermfg=green guibg=#000000
 hi User4  guifg=#00dfe7   " ctermbg=blue  ctermfg=green guibg=#000000
 hi User5  guifg=#000080   " ctermbg=blue  ctermfg=green guibg=#000000
set statusline=
" Depreciated Status Line"{{{
" set statusline+=%1*  "switch to User1 highlight FILENAME
" set statusline+=%2*  "switch to User2 highlight MODIFIED
" set statusline+=%3*  "switch to User3 highlight POSITION INFO
" set statusline+=%*   "switch back to statusline highlight

" set statusline=%1*\ %F	" Filepath
" set statusline+=%2*%m\ 	"Modified
" 	set statusline+=%*   "switch back to statusline highlight
" set statusline+=\ <%Y>\ 	"filetype
" 	set statusline+=%*   "switch back to statusline highlight
" set statusline+=FMT:%{&ff}:	" file format
" set statusline+=%{strlen(&fenc)?&fenc:'none'}	"file encoding
" 	set statusline+=%=
"
" 	set statusline+=%3*%<\ 	"TruncationPoint
" set statusline+=C:%02v\ 	" current column where cursor is
" set statusline+=Line:%l/%L[%p%%]\	" line X of Y [percent of file]
" set statusline+=HEX:0x\%02.2B\ 	" hex code of character under the cursor
"}}}
set laststatus=2

set cursorline
" highlight CursorLine guibg=#800000
set cursorcolumn
" highlight CursorColumn guibg=#5f0000	"af00ff"

set guioptions-=T	" Remove toolbar
set guioptions-=a	" Remove aiutoselect
set guioptions-=g	" Remove inactive menu options

set linespace=5                 " Extra pixel lines between rows
set guitablabel=%M\ %t
" }}}
" Courier New=11
if has('statusline')
	set statusline=%1*%f\ 						" Filename
		set statusline+=%2*						" User Col 2
	set statusline+=%(%W%M%)					" Preview, Modified/Readonly
		set statusline+=%3*						" User Col 3
	set statusline+=[%{&ff}/%Y]					" Fileformat & type
	set statusline+=\[%{getcwd()}]				" Current dir
		set statusline+=%=						" Right aligned
		set statusline+=%4*						" User Col 4
	set statusline+=%([%v,%l/%L]%)%p%%\ 		" File nav info
		set statusline+=%5*						" User Col 5
	set statusline+=%<0x\%04.4B 				" Hex code of character under the cursor
endif
" Autocommands"{{{
"	Always show line numbers, but only in current window.
set number
au WinEnter * :setlocal number au WinEnter * :setlocal foldcolumn=2
au WinLeave * :setlocal nonumber au WinLeave * :setlocal foldcolumn=0
" Save when losing focus
au FocusLost * :silent! wall au VimResized * :wincmd = " Resize splits when
" the window is resized au FileType c,cpp,java,php,javascript,python,xml,yml,css
autocmd BufWritePre <buffer> call StripTrailingWhitespace()
" Remove trailing whitespaces and ^M chars
au FileType c,cpp,cs,java set matchpairs+==:;
"Appends [StartChar]:[EndChar]; to % toggle group au FileType tex,plaintex
setlocal spell
" au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim
au InsertEnter * call InsertStatuslineColor(v:insertmode)
" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart
autocmd BufRead,BufNewFile *.nspk :set filetype=newspeak
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
"}}}

" OmniComplete
if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
		\if &omnifunc == "" |
		\setlocal omnifunc=syntaxcomplete#Complete |
		\endif
endif
set stl=%f%y\ %F\ %m\%r%=Col:%v\ Line:%l/%L[%p%%]\ Buf:#%n\ [%b][0x%B]
" Filename FileType ModFlag ReadOnlyFlag ||Col Line OutOf Line% Buffer Char
" OXChar
" :! start http://www.google.com

function! Jesus()
	!vimfiles\batcave\man.bat
	qa
endfunc
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	" vim:foldmethod=marker


