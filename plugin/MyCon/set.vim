" See *format-comments*
" Probation"{{{
" set debug =throw,beep
set guifont=Lucida_Console:h10:cANSI
" Encryption
set cryptmethod=blowfish
set key=
set shortmess=flmnrwxoOt
"}}}

" File IO"{{{
set history=200					" keep 200 lines of command line history
" Backups 
set nobackup						" Disable backup files ~$
set writebackup	"Write temp backup file when saving file
set swapfile						" Default
set backupskip=/tmp/*,/private/tmp/* " Make Vim able to edit crontab files again.
set undofile
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
set autowrite
set autoread
"}}}

" Searching"{{{
set hlsearch
set incsearch					" do incremental searching
set ignorecase
set smartcase
set showmatch
set matchpairs+=<:>,=:;             " Match, to be used with %
"}}}

" Line Overflow"{{{
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set wrap
set whichwrap=b,s,h,l,<,>,[,]   " Back\=space and cursor keys wrap
set linebreak   " Wrap lines at convenient points
"}}}

" Indent & Whitespace"{{{
set autoindent
set copyindent
set smartindent
set tabstop=4					" A tab is four spaces
set shiftwidth=4				" Number of spaces used for autoindenting
set softtabstop=4               " When hitting <BS>, like a tab is removed, even if spaces
set shiftround	  				" use multiple of shiftwidth when indenting with '<' and '>
set smarttab					"insert tabs on the start of a line according to shiftwidth, not tabstop
set noexpandtab "Prevents tabs becoming spaces
"}}}

" Autocompletion & Wildmenu"{{{
set wildmenu
set wildmode=longest:full,full
set wildignore=*.pyc,*.o,*.lo,*.la,*.exe,*.swp,*.db,*.bak,*.old,*.dat,*.,tmp,*.mdb,*~,~*
set wildignore+=.hg,.git,.svn				" Version control
set wildignore+=*.aux,*.out,*.toc				" LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary imgs
set wildignore+=*.obj,.dll,*.manifest			" compiled
set wildignore+=*.spl							" spelling
set wildignore+=*.sw?							" Vim swap

" Better Completion
set complete=.,w,b,t,i "Autocomplete reads: Current file, windows, buffer list entries, tags, ?included files
set completeopt=longest,menuone,preview


"}}}

" Limits for Efficiencey"{{{
set synmaxcol=800 " Don't try to highlight lines longer than 800 characters.
"?? Time out on key codes but not mappings.
" set notimeout
" set ttimeout
" set ttimeoutlen=10
"}}}

set showmode
set showcmd	 					" display incomplete commands

set lazyredraw "waits till macro is completed before re-rendering
set splitbelow "new split placed beneath current
set splitright " New split place to the right of current

set foldmethod=marker
set virtualedit=block,onemore   "Prevents cursor going past EOL, except for block selection

set scrolloff=5 "Keeps cursor line n lines from top&&bottom of form
set sidescroll=1
set sidescrolloff=10

set colorcolumn=+1
set mouse=a " Enable mouse everywhere
set gdefault	"Global flag on for substitutions
set linebreak
set modelines=3	"First & Last 3 lines of file can contain vim cmds in format vim:cmd0:cmd1 cmd2 Use space|colon
" set sps=best,30		"Spellsuggest type, lim
set foldlevelstart=0	" All folds closed on open
set printoptions=header:1,number:y	"Printout +lineNum
set printheader=%t%m%<%f	" Filename ModFlag Filepath

set list
set listchars=extends:»,precedes:»,trail:¤		" Tab & EOL determined per OS

if has("win32")
	set listchars+=tab:►\ ,eol:¶
	set showbreak=¬
endif

" No annoying sound on errors
set noerrorbells
set novisualbell
set vb t_vb=	"For terminal

set diffopt=filler,iwhite       " ignore all whitespace and sync

set formatoptions=cqrn1		"a
" c		Auto-wrap comments, inserting the current comment leader
" automatically. 

" r	Automatically insert the current comment leader after hitting <Enter> in
" Insert mode. 

" q	Allow formatting of comments with "gq". 

" a	Automatic formatting of paragraphs.  See |auto-format|. 

" n		When formatting text, recognize numbered lists. Uses the
" 'formatlistpat' option.

" 1		Don't break a line after a one-letter word.
set fillchars=vert:║,fold:≈
