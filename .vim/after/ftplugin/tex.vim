" Make tabs 4 characters wide instead of 8
setlocal tabstop=4
setlocal shiftwidth=4

" Wrap at 80 characters
setlocal textwidth=80

" Interpret .tex files as LaTeX by default
let g:tex_flavor='latex'

" Do not indent on ampersands (this mixes tabs and spaces for alignment, which
" is bad)
let g:vimtex_indent_on_ampersands=0
