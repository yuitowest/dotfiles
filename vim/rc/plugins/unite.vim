let g:unite_source_file_mru_limit = 200
let g:unite_enable_start_insert = 1
let g:unite_split_rule='topleft'
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup'
  let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_source_grep_max_candidates = 200
let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0

nnoremap [unite] <Nop>
xnoremap [unite] <Nop>
nmap f [unite]
xmap f [unite]

nnoremap <silent> <expr> <SID>(buffer-file) ':<C-u>Unite file -buffer-name=files -input=' . expand('%:p:h') . '/<CR>'
nmap <silent> [unite]f <SID>(buffer-file)
nnoremap <silent> [unite]p :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> [unite]o :<C-u>Unite -vertical -winwidth=30 outline<CR>
nnoremap <silent> [unite]c :<C-u>Unite -no-start-insert colorscheme<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]y :<C-u>Unite -no-start-insert yankround<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_all_exit)
  nmap <buffer> q <Plug>(unite_all_exit)
  nnoremap <silent><buffer><expr> dd unite#smart_map('dd', unite#do_action('delete'))
  nmap <buffer> <C-j> <Plug>(unite_toggle_auto_preview)
  nmap <buffer><expr> s unite#mappings#set_current_filters(['sorter_word'])
endfunction
