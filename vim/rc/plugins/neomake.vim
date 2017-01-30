let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_verbose = 0
augroup AutoNeomake
  autocmd!
  autocmd BufWritePost * Neomake
augroup END

let g:neomake_warning_sign = {
    \ 'text': '>',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_error_sign = {
    \ 'text': '>',
    \ 'texthl': 'ErrorMsg',
    \ }
