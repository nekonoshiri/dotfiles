" Vim filetype plugin file
" Language: Go

""""""""""
" indent
""""""""""

setlocal noexpandtab
setlocal listchars=tab:\ \ ,trail:_

""""""""""
" vim-go
""""""""""

" gofmt の代わりに goimports を使用
" import 宣言を自動で追加・削除してくれる
let g:go_fmt_command = "goimports"

" 各種ハイライトの有効化
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

