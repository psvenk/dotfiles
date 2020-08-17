" Make tabs 4 characters wide instead of 8
call tabstop#set(4)

" Wrap at 80 characters
setlocal textwidth=80

" Do not indent on ampersands (this mixes tabs and spaces for alignment, which
" is bad)
let g:vimtex_indent_on_ampersands=0

" Disable insert mode mappings (superseded by UltiSnips and Compose key)
let g:vimtex_imaps_enabled=0

" Analogous to the normal-mode mapping for K, add a mapping for finding the
" documentation of a specific package
nnoremap <LocalLeader>K :VimtexDocPackage<Space>
