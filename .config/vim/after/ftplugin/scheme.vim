let g:lisp_rainbow = 1
setlocal textwidth=72

" (no longer relevant; use vim-scheme instead of slimv)
" Remove -iconic argument from xterm, since Alacritty does not recognize that
" https://github.com/kovisoft/slimv/blob/d3ecf3dad564a63c79fb7ad432466a224de0c743/ftplugin/slimv.vim#L122
" let g:slimv_swank_scheme = '! SWANK_PORT=' . g:swank_port . ' xterm -e ' . SlimvSwankLoader() . ' &'
