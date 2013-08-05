" Vim syntax file
" Language Newspeak(1984)
" http://www.openlogic.com/wazi/bid/188101/Create-Your-Own-Syntax-Highlighting-in-Vim

if exists ("b:current_syntax")
	finish
endif

syn case ignore

syn match Adjective "\a\+ful\|Adjective"
syn match Adverb "\a\+wise\|Adverb"
syn match Negation "\a*un\a\+"
syn keyword BSyntax Bellyfeel Blackwhite Crimestop Crimethink Doublethink Duckspeak Facecrime Free Goodsex Goodthink Ingsoc Joycamp Newspeak Oldspeak Ownlife Sexcrime
syn keyword Mini Miniluv Minipax Miniplenty Minitrue Teledep
syn match BB "Big Brother\|BB"

highlight link Adjective Constant
highlight link Adverb Identifier
highlight link Negation Error
highlight link BSyntax PreProc
highlight link Mini Type
highlight link BB Type

let b:current_syntax = "newspeak"
