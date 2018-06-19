" Make bg color to equal terminal's bg color #262626
hi Normal ctermbg=235
hi NonText ctermbg=235
hi SignColumn ctermbg=235
hi LineNr ctermbg=235
hi CursorLine ctermbg=235

" Highlight current line number
hi CursorLineNR guifg=#F2FF5C gui=bold " ctermbg=235
hi Statement ctermfg=80
hi Operator ctermfg=212

" Clear ALE background color
hi clear ALEErrorSign
hi clear ALEWarningSign

" Visual selection background color
hi Visual guibg=#888888 ctermbg=237

" Change cursor color to white
hi Cursor guibg=#618AFB guifg=white

" Change cursor color to green when in insert mode
au InsertEnter * hi Cursor guibg=#618AFB guifg=white ctermbg=39 ctermfg=white

hi link rustStorage             PreProc
hi link mustacheConditionals    Function
hi link mustacheHelpers         Function
hi link mustacheSection         Function
hi link htmlLink                None

" Vim Bookmarks
highlight BookmarkSign ctermbg=NONE ctermfg=84 guifg=#b0d68b
highlight BookmarkAnnotationSign ctermbg=NONE ctermfg=84 guifg=#b0d68b
