function! HeavyToggle()
	let g:HeavyStatus = exists('g:HeavyStatus') ? !g:HeavyStatus : 1
	echo g:HeavyStatus
	call HeavyMetal()
endfunc
nnoremap <leader>ht :call HeavyToggle()<CR>
nnoremap <leader>hm :call HeavyMetal()<CR>

function! HeavyMetal()
	if g:HeavyStatus
		GundoHide
		GundoShow
		GundoRenderGraph
		echo "The name is iron-ic"
		autocmd BufWrite * call HeavyMetal()
	endif
endfunc
