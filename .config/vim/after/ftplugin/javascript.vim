" Make tabs 4 characters wide instead of 8
call tabstop#set(4)

set et

setlocal foldmethod=syntax

" If tsc is present, configure :make to use it
if filereadable("./node_modules/.bin/tsc")
	setlocal makeprg=./node_modules/.bin/tsc
	" tsc errorformat taken from
	" https://github.com/leafgarland/typescript-vim/blob/e25636b44211a4be7b089bfed7cf09aa7dd086f5/compiler/typescript.vim
	setlocal errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
endif
