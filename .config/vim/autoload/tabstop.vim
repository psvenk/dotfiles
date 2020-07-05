" Set tabstop and shiftwidth to specified value if not specified in
" .editorconfig
function! tabstop#set(val)
	try
		let l:ec_config = editorconfig_core#handler#get_configurations(
			\ {'target': expand('%')})
	catch
	endtry
	if type(ec_config) != type({})
		let l:ec_config = {}
	endif
	if (!has_key(l:ec_config, 'indent_size') ||
			\ l:ec_config['indent_size'] ==# 'tab') &&
			\ !has_key(l:ec_config, 'tab_width')
		exe 'setlocal tabstop=' . a:val
		exe 'setlocal shiftwidth=' . a:val
	endif
endfunction
