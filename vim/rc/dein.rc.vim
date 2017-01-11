let s:dein_dir = expand('$CACHE/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir . ',' . &runtimepath

let s:path = expand('$CACHE/dein')
if dein#load_state(s:path)
  call dein#begin(s:path)
  call dein#load_toml(expand('$VIM/rc/dein.toml'), {'lazy': 0})
  call dein#load_toml(expand('$VIM/rc/deinlazy.toml'), {'lazy': 1})
  call dein#load_toml(expand('$VIM/rc/deinft.toml'))
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
