augroup filetypedetect
  au! BufRead,BufNewFile *.hbs,*.handlebars set filetype=mustache
  au! BufRead,BufNewFile *.blade.php set filetype=html
augroup END

autocmd FileType html       : setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript : setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType handlebars : setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType less       : setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType org        : setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python     : setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType php        : setlocal shiftwidth=4 tabstop=4 expandtab
autocmd BufWritePre * :%s/\s\+$//e " automatically trim trailing space everytime we save

