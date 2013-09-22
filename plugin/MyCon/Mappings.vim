" Probation"{{{
nmap <leader>x :w<cr>:!chmod 755 %<cr>:e<cr>
" Losh
imap <c-u> <Esc>viw~i
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap <esc> :echo "Nope >^.^<"<cr>
inoremap <silent> <esc> <esc>:echo "Nope >^.^<"<cr>:2sleep<cr>a
"}}}
let maplocalleader = "|"
" Use <localleader> in mappings

" FunctionKeys "{{{
nnoremap <F1> :h 
nnoremap <F2> :so %<CR>:echo "Source Completed"<CR>
nnoremap <S-F2> :so $MYVIMRC<CR>:echo "Source vimrc"<CR>
nnoremap <C-F2> :!pdflatex %<CR>
nnoremap <F3> <Esc>:w
nnoremap <S-F3> <Esc>:w!
nnoremap <F4> <Esc>:x
nnoremap <S-F4> <Esc>:q!<CR>

nnoremap <F5> mzggg?G`z " Rot13
set pastetoggle=<F6>	"Toggles default formatting options on and off Use when inserting (pasting from clipboard)
" nnoremap <silent> <F7> :Ozzy<CR>
nnoremap <silent> <S-F7> :TagbarToggle<CR>
nnoremap <silent> <C-F7> :MBEToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <S-F8> :NERDTreeFind<CR>
nnoremap <C-F8> :NERDTreeClose<CR>:NERDTreeFromBookmark 

" F9 Syntax hl of word under the cursor
nnoremap <F9> :call SynStack()<CR>
" Syntax Highlight Group(s) of word under the cursor verbose
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
						\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
						\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

inoremap <F3> <Esc>:w<CR>i
vnoremap <f5> g?
"}}}

" Leader"{{{

" Quick alignment of text
nnoremap <leader>al :left<CR>
nnoremap <leader>ar :right<CR>
nnoremap <leader>ac :center<CR>

nnoremap <leader>ss :setlocal spell! <CR> " \ss to activate spell check
nnoremap <leader>sw :set wrap<CR>
nnoremap <leader>sl :set list!<cr> " Toggle [i]nvisible characters (EOL, tab, etc chars)
nnoremap <leader>sr :set relativenumber!<CR>:set relativenumber?<CR>
nnoremap <leader>sc :set fillchars=vert:║,fold:≈<CR>:set fillchars?<CR>
nnoremap <leader>sn :set number!<CR>:set number?<CR>

nnoremap <leader>d "_d " deletes to the blackhole register

nnoremap <leader>j :call Jesus()<CR>

nnoremap <leader>k kJ


vnoremap Q gq
nnoremap Q gqap$
nnoremap <leader>ev :tabnew $MYVIMRC <CR>
nnoremap <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
" Opens a new tab with the current buffer's path files
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr> " Unfuck my screen
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>[ [sz= " Move Left to next misspelt word and view suggestions
nnoremap <leader>] ]sz= " Move Right to next misspelt word and view suggestions


" Pull word under cursor into LHS of a substitute (for quick search and
" replace)
nnoremap <leader>z :%s/\<<C-r>=expand("<cword>")<CR>\>/

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>
" Remove the Windows ^M - when the encodings gets messed up
nnoremap <leader>c :nohlsearch<CR>:redraw!<CR>
nnoremap <leader>ct :ColorToggle<CR>

nnoremap <leader>md :%!C:\Users\Andrew\Documents\Markdown_1.0.1\Markdown.pl --html4tags<cr>

" \/ turn off search highlighting
nnoremap <leader>/ :nohl<CR>


" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"}}} 

"Arrow Keys"{{{
"Fast window switching"{{{
nnoremap <left> <C-W>h
nnoremap <right> <C-W>l
nnoremap <up> <C-W>k
nnoremap <down> <C-W>j

inoremap <left> <ESC><C-W>h
inoremap <right> <ESC><C-W>l
inoremap <up> <ESC><C-W>k
inoremap <down> <ESC><C-W>j
"}}}
" Smart way to move between windows
nnoremap <silent><c-left> :tabprev<cr>
nnoremap <silent><c-right> :tabnext<cr>
nnoremap <silent><c-up> :tabfirst<cr>
nnoremap <silent><c-down> :tablast<cr>
"}}}

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Tweak Default Functionality"{{{
nnoremap Y y$ " Makes Y behave like other capital commands

" Don't move on * #
nnoremap * *<c-o>
nnoremap # #<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap J mzJ`z " Keep the cursor in place while joining lines

nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w " Split line (sister to [J]oin lines)

nnoremap j gj
nnoremap k gk

vnoremap < <gv
vnoremap > >gv

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w " Split line (sister to [J]oin lines)

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
nnoremap <S-Space> zA
vnoremap <S-Space> zA

iab xdate <c-r>=strftime("%d/%m/%y %H:%M.%S")<cr>

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

" Visual mode pressing * or # searches for the current selection From an idea
" by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" "Uppercase word" mapping.  This mapping allows you to press <c-u> in insert
" mode to convert the current word to uppercase.  It works by exiting out of
" insert mode, recording the current cursor location in the z mark, using gUiw
" to uppercase inside the current word, moving back to the z mark, and
" entering insert mode again.
" inoremap <C-u> <esc>mzgUiw`za
" As above for lowercase
" inoremap <C-l> <esc>mzguiw`za
" }}}
