function! yuitowest#neocomplete#hook_add() abort
  " Launches neocomplete automatically on vim startup.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Use camel case completion.
  let g:neocomplete#enable_camel_case = 1
  " cache directory
  let g:neocomplete#data_directory = join([&directory, 'neco'], '/')
  " Sets minimum char length of syntax keyword.
  let g:neocomplete#min_keyword_length = 3
  " buffer file name pattern that locks neocomplete. e.g. ku.vim or fuzzyfinder
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  " This variable controls the number of candidates displayed in a pop-up menu
  let g:neocomplete#max_list = 20
  " Define file-type dependent dictionaries.
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'scala' : $HOME.'/.vim/dict/scala.dict',
        \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
        \ }
  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><C-e> neocomplete#cancel_popup()
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  " シンタックスハイライトの予約語を補完へ流用
  " autocmd FileType *
  "       \   if &l:omnifunc == ''
  "       \ |     setlocal omnifunc=syntaxcomplete#Complete
  "       \ | endif
  " Enable omni completion. Not required if they are already set elsewhere in .vimrc
  " autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType c setlocal omnifunc=ccomplete#Complete
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType erlang setlocal omnifunc=erlang_complete#Complete
  autocmd FileType python setlocal omnifunc=jedi#completions

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif

  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
  let g:neocomplete#force_omni_input_patterns.python='\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
endfunction
