augroup MyAutoCmd
  autocmd!
augroup END

set encoding=utf-8

filetype plugin indent off

so ~/.vim/rc/dein.vim

filetype plugin indent on

set t_Co=256

so ~/.vim/rc/settings.vim

so ~/.vim/rc/command.vim

so ~/.vim/rc/keymap.vim

if !exists('s:loaded_my_vimrc')
  let s:loaded_my_vimrc = 1
endif

set secure

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
