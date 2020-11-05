" Make tabs 4 characters wide instead of 8
call tabstop#set(4)

" Wrap at 80 characters
setlocal textwidth=80

" Disable conceal (mma.vim included in vim-polyglot sets this to 2)
setlocal conceallevel=0

" Analogous to the normal-mode mapping for K, add a mapping for finding the
" documentation of a specific package
nnoremap <LocalLeader>K :VimtexDocPackage<Space>
