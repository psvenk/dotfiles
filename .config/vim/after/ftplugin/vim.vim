" Make tabs 4 characters wide instead of 8
call tabstop#set(4)

" Wrap at 80 characters
setlocal textwidth=80

" Use one tab to indent continuation lines
let g:vim_indent_cont=&shiftwidth
