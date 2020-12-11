set et
set sw=2
set ts=8
set tw=80
" Use ocp-indent
" https://github.com/let-def/ocp-indent-vim/issues/6
au filetype ocaml setlocal indentexpr=ocpindent#OcpIndentLine()
