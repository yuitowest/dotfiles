function! yuitowest#unite#hook_add() abort
  let g:unite_source_file_mru_limit = 200
  let g:unite_enable_start_insert = 1
  let g:unite_split_rule='topleft'
  let g:unite_data_directory = expand(join([&directory, 'unite'], '/'))
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup'
    let g:unite_source_grep_recursive_opt = ''
  endif
  let g:unite_source_grep_max_candidates = 200
  let g:unite_source_history_yank_enable = 1
  let g:unite_force_overwrite_statusline = 0
  call unite#custom#source(
        \ 'file_rec/async', 'ignore_pattern', '\(\.png\|\.gif\|\.jpeg\|\.jpg\|\.pyc\)$')
endfunction
