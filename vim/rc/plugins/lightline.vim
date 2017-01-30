let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'], ['filename']
      \   ],
      \   'right': [
      \      ['ale'], ['lineinfo'], ['fileformat', 'fileencoding', 'filetype']
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
      \   'ale': 'ALEStatus',
      \ },
      \ 'component_type': {
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
    let l:mode = 'N'
  elseif lightline#mode() == 'INSERT'
    let l:mode = 'I'
  elseif lightline#mode() == 'VISUAL'
    let l:mode = 'V'
  endif
  return MyReadonly(). l:mode
endfunction

function! ALEStatus()
  return ALEGetStatusLine()
endfunction
