function! s:source_plugin_rc(path, ...) abort
  let abspath = resolve(expand('$VIM/rc/plugins/' . a:path))
  execute 'source' fnameescape(abspath)
  return
endfunction

call s:source_plugin_rc('lightline.vim')
call s:source_plugin_rc('yankround.vim')
call s:source_plugin_rc('neocomplete.vim')
call s:source_plugin_rc('unite.vim')
call s:source_plugin_rc('buftabline.vim')
call s:source_plugin_rc('quickhl.vim')
call s:source_plugin_rc('indentLine.vim')
call s:source_plugin_rc('rooter.vim')
call s:source_plugin_rc('ale.vim')
