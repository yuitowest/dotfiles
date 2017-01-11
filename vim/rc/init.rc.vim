if &compatible
  set nocompatible
endif

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_matchparen        = 1
let g:loaded_LogiPat           = 1
let g:loaded_logipat           = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_man               = 1
let g:loaded_matchit           = 1

let $CACHE = expand('~/.cache')
let $VIM = expand('~/.vim')

function! s:source_rc(path, ...) abort
  let abspath = resolve(expand('$VIM/rc/' . a:path))
  execute 'source' fnameescape(abspath)
  return
endfunction

call s:source_rc('dein.rc.vim')

syntax enable
filetype plugin indent on

call s:source_rc('settings.rc.vim')
call s:source_rc('keymap.rc.vim')

set helplang& helplang=en,ja

let t:cwd = getcwd()

if !exists('s:loaded_my_vimrc')
  let s:loaded_my_vimrc = 1
endif

set secure
" vim: foldmethod=marker
