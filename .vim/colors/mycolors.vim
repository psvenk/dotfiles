hi clear
if exists("syntax_on")
	syntax reset
endif

" Show line numbers in grey
hi LineNr ctermfg=Grey

" Highlight number of currently focused line
hi CursorLine cterm=NONE
hi CursorLineNr cterm=bold

" Use colors close to (but not exactly) those of git diff for viewing
" diff files or Fugitive's inline diffs
hi diffFile ctermfg=White
hi diffNewFile ctermfg=White
hi diffIndexLine ctermfg=White
hi diffLine ctermfg=DarkCyan
hi diffSubname ctermfg=White
hi diffAdded ctermfg=DarkGreen
hi diffRemoved ctermfg=DarkRed
