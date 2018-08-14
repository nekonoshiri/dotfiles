" neovim 設定ファイル

filetype plugin indent on " still needed

set runtimepath+=~/dotfiles/vim

" vim と共通の設定を読み込み（runtimepath からの相対）
runtime config/common.vim

""""""""""
" backups
""""""""""

set backup " バックアップを残す
set backupdir-=. " カレントディレクトリにはバックアップを残さない

""""""""""
" terminal
""""""""""

" 遡行可能行数
set scrollback=10000

" ESC で command mode
tnoremap <silent> <ESC> <C-\><C-n>

" 新しいターミナル
command! Tnew :enew | :terminal

""""""""""
" dein
""""""""""

" dein の場所
let s:dein_dir = expand('~/.config/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" プラグイン記述ファイルの場所
let s:toml_dir = expand('~/dotfiles/vim/dein_toml')
let s:toml = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

" dein が runtimepath になければ追加，更に dein 本体がなければ git clone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute "set runtimepath+=" . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

""""""""""
" deoplete
""""""""""

call dein#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1

" 未インストールプラグインのチェック
if dein#check_install()
  call dein#install()
endif

