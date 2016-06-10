" neocomplete {{{
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
" }}}

" ctrlp {{{
let g:ctrlp_map = ''
let g:ctrlp_working_path_mode = 'ra'
" }}}

" unite {{{
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
" }}}

" matchparen {{{
let g:loaded_matchparen = 1
" }}}

" Indent-guides {{{
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#222333  gui=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#233333  gui=NONE
if 'dark' == &background
  hi IndentGuidesOdd  ctermbg=black
  hi IndentGuidesEven ctermbg=darkgrey
else
  hi IndentGuidesOdd  ctermbg=white
  hi IndentGuidesEven ctermbg=lightgrey
endif
" }}}

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'], ['filename']
      \   ],
      \   'right': [
      \      ['lineinfo'], ['anzu', 'fileformat', 'fileencoding', 'filetype']
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \     ['filename']
      \   ],
      \   'right': []
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'filename': 'MyFilename',
      \   'mode': 'MyMode',
      \   'anzu': 'anzu#search_status',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
      \ }

" 色の設定
let s:lightline_color = g:lightline#colorscheme#landscape#palette

let s:lightline_color.inactive.left = [ [ '#8a8a8a', '#262626', 233, 235 ], [ '#000000', '#FFFFCC', 233, 235 ] ]
let s:lightline_color.normal.middle = [ [ '#8a8a8a', '#303030', 245, 236 ] ]
let s:lightline_color.inactive.middle = [ [ '#303030', '#303030', 236, 233 ] ]
let s:lightline_color.tabline.tabsel = [ [ '#dadada', '#606060', 253, 241 ] ]
let s:lightline_color.tabline.middle = [ [ '#8a8a8a', '#303030', 245, 236  ] ]

let g:lightline#colorscheme#landscape#palette = s:lightline_color

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? '⭤ ' : ''
endfunction

function! MyCwd()
  return fnamemodify(getcwd(), ":~")
endfunction

function! MyFilename()
  let l:str = ''

  if &ft == 'unite'
    let l:str = l:str . unite#get_status_string()
  else
    if '' != expand('%:t')
      let l:str = l:str . expand('%:t')
    else
      let l:str = l:str . '[No Name]'
    endif
  endif
  if '' != MyModified()
    let l:str = l:str . ' ' . MyModified()
  end

  return l:str
endfunction

function! MyMode()
  let l:mode = ''
  if lightline#mode() == 'NORMAL'
    let l:mode = '( ・ω・)'
  elseif lightline#mode() == 'INSERT'
    let l:mode = '( ｰ`дｰ´)'
  elseif lightline#mode() == 'VISUAL'
    let l:mode = '=͟͟͞͞ ( ・ω・)'
  endif
  return MyReadonly(). l:mode
endfunction
" }}}

" vim-anzu {{{
autocmd MyAutoCmd WinLeave,TabLeave * call anzu#clear_search_status()
" }}}

" auto-ctags {{{
let g:auto_ctags = 0
let g:auto_ctags_directory_list = ['.git', '.svn', 'node_modules']
" }}}

" vim-rooter {{{
let g:rooter_use_lcd = 1
autocmd BufEnter * :Rooter
" }}}

" memolist {{{
let g:memolist_path = "~/Dropbox/vim/memolist"
let g:memolist_template_dir_path = "~/.vim/template/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d"
let g:memolist_prompt_tags = 1
let g:memolist_qfixgrep = 1
let g:memolist_filename_prefix_none = 1
let g:memolist_unite = 1
let g:memolist_unite_source = "file_rec"
let g:memolist_unite_option = "-auto-preview -start-insert"
" }}}

" choosewin {{{
let g:choosewin_overlay_enable          = 1
let g:choosewin_overlay_clear_multibyte = 1
" }}}

" BufKill {{{
let g:BufKillActionWhenBufferDisplayedInAnotherWindow = 'kill'
" }}}

" vim-quickhl {{{
let g:quickhl_manual_colors = [
      \ "gui=bold ctermfg=7  ctermbg=1    guifg=#ffffff   guibg=#ff3333",
      \ "gui=bold ctermfg=7  ctermbg=2    guifg=#ffffff   guibg=#0000FF",
      \ "gui=bold ctermfg=7  ctermbg=3    guifg=#ffffff   guibg=#009900",
      \ "gui=bold ctermfg=7  ctermbg=4    guifg=#ffffff   guibg=#bd9700",
      \ "gui=bold ctermfg=7  ctermbg=5    guifg=#000000   guibg=#ffffff",
      \ "gui=bold ctermfg=7  ctermbg=6    guifg=#000000   guibg=#00FFFF",
      \ "gui=bold ctermfg=0  ctermbg=7    guifg=#000000   guibg=#fff761",
      \ "gui=bold ctermfg=7  ctermbg=196  guifg=#ffffff   guibg=#800000",
      \ "gui=bold ctermfg=7  ctermbg=120  guifg=#ffffff   guibg=#FF00FF",
      \ "gui=bold ctermfg=7  ctermbg=228  guifg=#000000   guibg=#00FF00",
      \ ]
" }}}

" syntastic {{{
let g:syntastic_erlang_checkers = ['escript']
" }}}

" vim-erlang {{{
let g:erlang_show_errors = 0
" }}}

" vim-json {{{
let g:vim_json_syntax_conceal = 0
" }}}

" buftabline {{{
let g:buftabline_numbers    = 0
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
" }}}


" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
