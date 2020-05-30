hi clear
if exists("syntax_on")
	syntax reset
endif

" Show line numbers in grey
hi LineNr ctermfg=Grey guifg=grey

" Highlight currently focused line number and (with true color) full line
hi CursorLine cterm=NONE guibg=grey25
hi CursorLineNr cterm=bold

" Use more subtle colors for visual selection and closed folds
hi Visual guibg=grey40
hi Folded guibg=grey50 guifg=cyan1

" Use colors close to those of git diff for viewing diff files or Fugitive's
" inline diffs
hi diffFile ctermfg=White guifg=DodgerBlue cterm=bold
hi diffNewFile ctermfg=White guifg=LightSteelBlue
hi diffIndexLine ctermfg=White guifg=yellow
hi diffLine ctermfg=DarkCyan guifg=cyan2
hi diffSubname ctermfg=White guifg=white
hi diffAdded ctermfg=DarkGreen guifg=green3
hi diffRemoved ctermfg=DarkRed guifg=red3
