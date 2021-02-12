" Make tabs 4 characters wide instead of 8
call tabstop#set(4)

" Disable conceal (to override vim-pandoc-syntax)
setlocal conceallevel=0

let s:compilation_enabled = 0

function ToggleCompilation()
	if s:compilation_enabled
		echo 'Automatic compilation stopped'
		let s:compilation_enabled = 0
		au! autocompile * <buffer>
	else
		echo 'Automatic compilation started'
		let s:compilation_enabled = 1
		augroup autocompile
			au BufWritePost <buffer> exe '!make -C'
				\ . shellescape(expand('%:h'))
		augroup END
		exe '!make -C' . shellescape(expand('%:h'))
	endif
endfunction

" Add keybinding for automatic compilation, reminiscent of vimtex
map <LocalLeader>ll :call ToggleCompilation()<Enter>
