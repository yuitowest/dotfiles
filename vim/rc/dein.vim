if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
endif

if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))

    call dein#load_toml(expand('~/.vim/dein') . '/dein.toml', {'lazy': 0})
    call dein#load_toml(expand('~/.vim/dein') . '/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif
