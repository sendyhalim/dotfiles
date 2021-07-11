augroup filetypedetect
  au! BufRead,BufNewFile *.hbs,*.handlebars set filetype=mustache
  au! BufRead,BufNewFile *.blade.php set filetype=blade
augroup END

autocmd FileType html set shiftwidth=2 tabstop=2 expandtab
autocmd FileType blade set shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript set shiftwidth=2 tabstop=2 expandtab
autocmd FileType handlebars set shiftwidth=2 tabstop=2 expandtab
autocmd FileType less set shiftwidth=2 tabstop=2 expandtab
autocmd FileType org set shiftwidth=2 tabstop=2 expandtab
autocmd FileType python set shiftwidth=4 tabstop=4 expandtab
autocmd FileType php set shiftwidth=2 tabstop=2 expandtab

autocmd BufWritePre * :%s/\s\+$//e " automatically trim trailing space everytime we save


augroup CocGroup
  autocmd!
  " Disable COC on Java because it's annoying
  autocmd BufNew,BufEnter *.java execute "silent! CocDisable"
augroup end
