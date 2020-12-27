hi clear
if exists("syntax_on")
	syntax reset
endif

" Set dark background
" hi Normal guifg=white guibg=black
" set background=dark

" Show line numbers in grey
hi LineNr ctermfg=Grey guifg=grey

" Highlight currently focused line number and full line
hi CursorLine cterm=NONE ctermbg=240 guibg=grey25
hi CursorLineNr cterm=bold

" Use more subtle colors for visual selection and closed folds
hi Visual guibg=grey40
hi Folded guibg=grey50 guifg=cyan1

" Keep Todo and Error background colors on cursorline
" https://vi.stackexchange.com/a/3289
hi Todo ctermfg=Yellow ctermbg=Black cterm=reverse
	\ guifg=yellow guibg=black gui=reverse
hi Error ctermfg=Red ctermbg=White cterm=reverse
	\ guifg=red guibg=white gui=reverse

" Use colors close to those of git diff for viewing diff files or Fugitive's
" inline diffs
hi diffFile ctermfg=White guifg=DodgerBlue cterm=bold
hi diffNewFile ctermfg=White guifg=LightSteelBlue
hi diffIndexLine ctermfg=White guifg=yellow
hi diffLine ctermfg=DarkCyan guifg=cyan2
hi diffSubname ctermfg=White guifg=white
hi diffAdded ctermfg=DarkGreen guifg=green3
hi diffRemoved ctermfg=DarkRed guifg=red3

" Better colors for Markdown
hi link markdownHeadingRule Title
if &termguicolors
	hi Underlined guifg=DodgerBlue
	hi Title guifg=coral
endif

if &termguicolors
	hi String guifg=LightGoldenrod
	hi Character guifg=gold3
	hi Number guifg=SandyBrown
	hi Boolean guifg=IndianRed2

	hi Identifier guifg=turquoise1
	hi Function guifg=DeepSkyBlue1

	hi Include guifg=#cf70ff
	hi StorageClass guifg=#6cda0b
	hi SpecialChar guifg=#ff7b00
	hi Delimiter guifg=#d2982d
endif
