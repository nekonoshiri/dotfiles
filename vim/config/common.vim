""""""""""
" display
""""""""""

set number " 行番号
set list " 不可視文字
set listchars=tab:>\ ,trail:_
set cursorline " カーソル行
set colorcolumn=80 " 80 文字目
set showtabline=2 " 常にタブラインを表示

""""""""""
" colorscheme
""""""""""

autocmd ColorScheme * highlight Pmenu ctermfg=Blue ctermbg=Grey
autocmd ColorScheme * highlight PmenuSel ctermfg=Blue ctermbg=Red
colorscheme koehler

""""""""""
" indent
""""""""""

set tabstop=2 " タブ表示幅
set expandtab " タブを空白に展開
set softtabstop=2 " タブ展開幅
set shiftwidth=2 " 自動インデント幅
set smartindent " 高度な自動インデント

""""""""""
" complete
""""""""""

set pumheight=10 " 補完メニュー高さ

""""""""""
" move
""""""""""

" 矢印キーでバッファ移動
nnoremap <Left>  :<C-u>bprev<CR>
nnoremap <Right> :<C-u>bnext<CR>

" 最上部までスクロールした後１行目に戻る
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" .
  \ (line('.') < 1 + winheight(0) ? 'H' : 'L')
" 最下部までスクロール時最終行が見えたら止まる
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" .
  \ (line('.') > line('$') - winheight(0) ? 'L' : 'H')
" 最後までスクロールした後はカーソル移動
noremap <expr> <C-y> (line('w0') <= 1 ? 'k' : "\<C-y>")
noremap <expr> <C-e> (line('w$') >= line('$') ? 'j' : "\<C-e>")

""""""""""
" other
""""""""""

" 全モードでマウス使用
if has('mouse')
  set mouse=a
endif
set hidden " 未保存でも別のファイルを開ける

" Y で行末までヤンク
nnoremap Y y$

""""""""""
" sayonara
""""""""""

" command! -bar -nargs=* -complete=file -range=% -bang W
"   \ <line1>,<line2>write<bang> <args>
" command! -bar -nargs=* -complete=file -range=% -bang Write
"   \ <line1>,<line2>write<bang> <args>
" command! -bar -nargs=* -complete=file -range=% -bang Wq
"   \ <line1>,<line2>write<bang> <args> | :Sayonara
command! -bar -nargs=* -complete=file -range=% -bang WQ
  \ <line1>,<line2>write<bang> <args> | :Sayonara
"
" command! -bar -bang Wqall wqall<bang>
" command! -bar -bang WQall wqall<bang>
"
command! -bar Q :Sayonara
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Q' : 'q')<CR>
cabbrev wq <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'WQ' : 'wq')<CR>

" command! -bar Quit :Sayonara
" command! -bar -bang Qall qall<bang>

""""""""""
" vim-lightline
" lightline-buffer
""""""""""

" lightline-buffer の設定
let g:lightline = {
\   'tabline': {
\     'left': [['bufferinfo'], ['bufferbefore', 'buffercurrent', 'bufferafter']],
\     'right': [],
\   },
\   'component_expand': {
\     'buffercurrent': 'lightline#buffer#buffercurrent2',
\   },
\   'component_type': {
\     'buffercurrent': 'tabsel',
\   },
\   'component_function': {
\     'bufferbefore': 'lightline#buffer#bufferbefore',
\     'bufferafter': 'lightline#buffer#bufferafter',
\   'bufferinfo': 'lightline#buffer#bufferinfo',
\   },
\ }

""""""""""
" vim-better-whitespace
""""""""""

" ファイル保存時に末尾空白を自動削除
autocmd BufEnter * EnableStripWhitespaceOnSave

