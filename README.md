# dotfiles

## 使用例

```
mkdir -p .vim/vimbackup
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
```

## Bugs

rm にエイリアス設定してると `dein#install#_rm` がそれを呼んでしまうっぽい．
そのせいでうまく動かない場合はとりあえず
`dein.vim/autoload/dein/install.vim` の

```
  let rm_command = dein#util#_is_windows() ? 'rmdir /S /Q' : 'rm -rf'
```

を

```
  let rm_command = dein#util#_is_windows() ? 'rmdir /S /Q' : '/bin/rm -rf'
```

に変えると動く．
