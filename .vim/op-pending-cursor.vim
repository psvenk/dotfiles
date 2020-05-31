" Use an underline cursor for operator-pending mode.
"
" Authors: laktak and Martin Tournoij on Vi and Vim Stack Exchange
" 	https://vi.stackexchange.com/a/11738
" Modified slightly by psvenk to use regex matching for mode names and
" to stop a block cursor from being activated upon entering insert mode
" after operator pending mode (e.g. caw)
"
" License: CC-BY-SA-4.0


" This is esentially:
"   exec 'silent !printf "\e[" . a:t . ' q'
"   redraw!
" but without the screen flash
function! s:setCursor(t)
    " Save existing values.
    let [l:title, l:t_ts, l:t_fs, l:titlestring] = [&title, &t_ts, &t_fs, &titlestring]

    try
        let &titleold = ''
        let &t_ts = "\e[0;0"
        let &t_fs = "\e[" . a:t . ' q'
        set title
        set titlestring=H
        redraw!
    finally
        let [&title, &t_ts, &t_fs, &titlestring] = [l:title, l:t_ts, l:t_fs, l:titlestring]
    endtry
endfunction

let s:prevmode = ''
function! DetectPendingMode(timer)
    let l:mode = mode(1)
    if l:mode is# s:prevmode
        return
    endif

    if l:mode =~# '^no'
        call <SID>setCursor(4)
    elseif s:prevmode =~# '^no' && l:mode !~# '^i'
        call <SID>setCursor(2)
    endif
    let s:prevmode = l:mode
endfunction

call timer_start(250, 'DetectPendingMode', {'repeat': -1})
