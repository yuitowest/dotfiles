if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neomru.vim', {
      \ 'depends' : 'Shougo/unite.vim'
      \ }
NeoBundle 'kana/vim-smartword'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \    },
      \ }
NeoBundle 'sgur/unite-qf', {
      \ 'depends' : 'Shougo/unite.vim'
      \ }
" NeoBundle 'appleYaks/bufkill.vim.git'
NeoBundle 'moll/vim-bbye'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 't9md/vim-choosewin.git'
NeoBundle 'tomasr/molokai'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundleLazy 'davidhalter/jedi-vim', {
      \ 'autoload': {
      \   'filetypes': ['python', 'python3', 'djangohtml']
      \ },
      \ 'build' : {
      \     'mac'     : 'git submodule update --init',
      \ }}
NeoBundleLazy 'nvie/vim-flake8', {
      \ 'autoload': {
      \   'filetypes': ['python', 'python3', 'djangohtml']
      \ },
      \ 'build' : {
      \     'mac': 'pip install flake8',
      \ }}
NeoBundle 'duckpunch/vim-python-indent'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'vim-erlang/vim-erlang-runtime'
NeoBundle 'vim-erlang/vim-erlang-skeletons'
NeoBundle 'vim-erlang/vim-erlang-compiler'
NeoBundle 'vim-erlang/vim-erlang-tags'
NeoBundle 'vim-erlang/vim-erlang-omnicomplete'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'cohama/vim-hier'
NeoBundle "dannyob/quickfixstatus"
NeoBundle 'will133/vim-dirdiff'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ap/vim-buftabline'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'itchyny/vim-parenmatch'
NeoBundle 'elzr/vim-json'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'elixir-lang/vim-elixir'
call neobundle#end()
