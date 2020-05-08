" Show line numbers
set number

" Enable syntax highlighting
syntax on

" Enable X11 clipboard
set clipboard^=unnamedplus

" Automatically continue comment lines
set formatoptions^=cro

" Map jj to escape in insert, replace, visual, and select modes
inoremap jj <Esc>
vnoremap jj <Esc>
