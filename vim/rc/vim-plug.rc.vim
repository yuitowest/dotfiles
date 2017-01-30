if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('$VIM/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p $VIM/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git $VIM/plugged/vim-plug/autoload')
  end
endif

call plug#begin(expand('$VIM/plugged'))
  Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
  Plug 'tomasr/molokai'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'LeafCage/yankround.vim'
  Plug 'ap/vim-buftabline'
  Plug 'moll/vim-bbye'
  Plug 't9md/vim-quickhl'
  Plug 'kana/vim-smartword'
  Plug 'kana/vim-smartchr'
  Plug 'tpope/vim-surround'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-rooter'
  " Plug 'neomake/neomake'
  Plug 'w0rp/ale'
  Plug 'itchyny/vim-parenmatch'
  Plug 'Shougo/context_filetype.vim'
  Plug 'osyo-manga/vim-precious'
  Plug 'itchyny/lightline.vim'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/neomru.vim'
  Plug 'thinca/vim-quickrun'
  Plug 'will133/vim-dirdiff'
  Plug 'junegunn/vim-easy-align'

  " markdown
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  " json
  Plug 'elzr/vim-json', { 'for': 'json' }
  " python
  Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
  Plug 'duckpunch/vim-python-indent', { 'for': 'python' }
  " html
  Plug 'othree/html5.vim', { 'for': 'html' }
  " erlang
  Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-tags', { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
  " swift
  Plug 'keith/swift.vim', { 'for': 'swift' }
  " JavaScript
  Plug 'pangloss/vim-javascript'
  Plug 'MaxMEllon/vim-jsx-pretty'
call plug#end()
