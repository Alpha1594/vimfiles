function! Struct()
	let words = []
	for linenum in range("1", line('$'))	"All lines in buffer >words[]
		let foo =getline(linenum) 
		call add(words, foo)
	endfor
	%g/.*/d									"Clear buffer

	let index = 0
	call append(0, ["public struct ".words[index]."{"])	"public struct called $words[0]
	for l in range(1, len(words)-1)			"Each list element as public var
		let index = index+1
		call append(line("$")-1, "\t public ".words[index].";")
	endfor
	
	let args = ""
	for a in range(1, len(words)-1)			" constructor arguements =>(str) args
		let args=args.words[a].", "
	endfor
	let args=strpart(args,0,strridx(args,", "))

	call append(line("$")-1, ["\t public ".words[0]."(".args.")","\t {" ])
		" Constructor header +args 
	let index = 0
	for l in range(1, len(words)-1)
		let index = index+1
		let var = strpart(words[index], strridx(words[index], " ")+1)
		" let string ="this.".words[index]." = ".words[index].";"
		call append(line("$")-1, "\t\t this.".var." = ".var.";")
	endfor
	call append(line("$")-1, ["\t }", "}"])
	set ft=cs
	set foldlevel=99
	%yank
	echo "Struct yanked to default register"
endfunc
