" Show line numbers in grey
set number
highlight LineNr ctermfg=Grey

" Enable syntax highlighting
syntax on

" Enable X11 clipboard
set clipboard^=unnamedplus

" Automatically continue comment lines
set formatoptions^=cro

" Map jj to escape in insert and replace modes
inoremap jj <Esc>

" Allow filetype-specific plugins and indenting
filetype plugin indent on

" Interpret .tex files as LaTeX by default
let g:tex_flavor='latex'
" Compile to PDF instead of DVI
let g:Tex_DefaultTargetFormat='pdf'
