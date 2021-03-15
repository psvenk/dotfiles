" Do not indent on ampersands (this mixes tabs and spaces for alignment, which
" is bad)
let g:vimtex_indent_on_ampersands = 0

" Disable insert mode mappings (superseded by UltiSnips and Compose key)
let g:vimtex_imaps_enabled = 0

" Enable folding
let g:vimtex_fold_enabled = 1
" Use manual folding (foldexpr is quite slow on files of medium to large size)
let g:vimtex_fold_manual = 1

" Add aliases for Wolfram Language nested syntax highlighting
let g:vimtex_syntax_nested = {
	\	'aliases': {
	\ 		'C': 'c',
	\ 		'csharp': 'cs',
	\ 		'mathematica': 'mma',
	\ 		'wolfram': 'mma',
	\ 	},
	\ 	'ignored': {
	\ 		'cs': [
	\ 			'csBraces',
	\ 		],
	\ 		'python': [
	\			'pythonEscape',
	\			'pythonBEscape',
	\			'pythonBytesEscape',
	\		],
	\ 		'java': [
	\			'javaError',
	\		],
	\ 		'haskell': [
	\			'hsVarSym',
	\		],
	\ 	},
	\ }
