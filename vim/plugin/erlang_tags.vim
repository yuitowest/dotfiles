function! ErlangCtags()
  let s:cmd_path = '~/.vim/bundle/vim-erlang-tags/bin/vim-erlang-tags.erl'
  let s:tags_lock_name = auto_ctags#ctags_lock_path()
  if glob(s:tags_lock_name) == ''
    let s:cmd = 'touch '.s:tags_lock_name.' && '
          \.s:cmd_path.' --otp --ignore dev'.' && '
          \.'rm '.s:tags_lock_name
    silent! execute '!sh -c "'.s:cmd.'" 1>/dev/null 2>/dev/null &'
  endif
endfunction
command ETags call ErlangCtags()
