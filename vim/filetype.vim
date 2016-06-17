if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  autocmd! BufRead,BufNewFile *.md setfiletype markdown
  autocmd! BufRead,BufNewFile *.toml setfiletype toml
augroup END
