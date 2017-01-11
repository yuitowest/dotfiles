let mapleader = ','
let g:mapleader = ','
let g:maplocalleader = ','
nnoremap x "_x
vnoremap x "_x
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap H :<C-u>help<Space><C-r><C-w><CR>
vnoremap <silent> <C-p> "0p<CR>
xnoremap <TAB>  >gv
xnoremap <S-TAB>  <gv
nnoremap P P=']

" move
vnoremap j gj
vnoremap k gk
nnoremap <C-u> 5<C-y>
nnoremap <C-d> 5<C-e>
nnoremap <C-a> ^
nnoremap <C-e> $
vnoremap <C-a> ^
vnoremap <C-e> $
noremap j gj
noremap k gk
map w <Plug>(smartword-w)
map b <Plug>(smartword-b)
map e <Plug>(smartword-e)
map ge <Plug>(smartword-ge)
vnoremap v $h

" search
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
vnoremap * "zy:let @/ = @z<CR>n

" semicoron
noremap : ;
nnoremap [scoron] <Nop>
nmap ; [scoron]
noremap [scoron]: :
nnoremap <silent> [scoron]w :w<CR>
nnoremap <silent> [scoron]d :Bdelete<CR>
nnoremap <silent> [scoron]q :q<CR>
nnoremap <silent> [scoron]W :w!<CR>
nnoremap <silent> [scoron]D :Bdelete!<CR>
nnoremap <silent> [scoron]Q :q!<CR>
nnoremap <silent> [scoron]; :<C-u>Unite buffer<CR>

" space
nnoremap [Space] <Nop>
xnoremap [Space] <Nop>
nmap <Space> [Space]
xmap <Space> [Space]

" search
nnoremap <silent> [Space]/ :<C-u>call toggle_option#execute('hlsearch')<CR>
nnoremap <silent> [Space]c :<C-u>call toggle_option#execute('cursorline')<CR>
nnoremap <silent> [Space]d :<C-u>CD<CR>
nnoremap <silent> [Space]v :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> [Space]g :<C-u>edit $MYGVIMRC<CR>
nnoremap <silent> [Space]s
  \ :<C-u>source $MYVIMRC\| if has('gui_running') \|source $MYGVIMRC \| endif<CR>

" =============================================================================
" window
" =============================================================================
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
map <kPlus> <C-w>+
map <kMinus> <C-w>-

" =============================================================================
" cmdwinEnter
" =============================================================================
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>
nmap :  <sid>(command-line-enter)
xmap :  <sid>(command-line-enter)

autocmd MyAutoCmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction

" =============================================================================
" close fold
" =============================================================================
nnoremap <expr> h
      \ col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'

nnoremap <expr> l
      \ foldclosed(line('.')) != -1 ? 'zo' : 'l'
