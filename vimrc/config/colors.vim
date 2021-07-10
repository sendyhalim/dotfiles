" General
" --------------------
" Make bg color to equal terminal's bg color #262626
hi Normal     guibg=#262626 ctermbg=235
hi NonText    guibg=#262626 ctermbg=235
hi SignColumn guibg=#262626 ctermbg=235
hi LineNr     guibg=#262626 ctermbg=235
hi CursorLine guibg=#262626 ctermbg=235
hi Identifier guifg=#1db0e3 ctermfg=38
hi Special    guifg=#41d989 ctermfg=42
hi Statement  ctermfg=80
hi Operator   guifg=#FD98BA ctermfg=212
hi Type       guifg=#85afaf

" Highlight current line number
hi CursorLineNR guibg=guibg=#262626 guifg=#F2FF5C gui=bold ctermbg=235

" Visual selection background color
hi Visual guibg=#333333 ctermbg=237


" ALE
" --------------------
" Clear ALE background color
hi clear ALEErrorSign
hi clear ALEWarningSign


" Vim illuminate
" --------------------
" By default it follows CursorLine color, but since CursorLine is set to be
" the same as vim background then it won't show.
" See the plugin https://github.com/RRethy/vim-illuminate
hi illuminatedWord guibg=#2F2F2F cterm=underline gui=underline


" Cursor
" --------------------
" Change cursor color to white
hi Cursor guibg=#618AFB guifg=white

" Change cursor color to green when in insert mode
au InsertEnter * hi Cursor guibg=#618AFB guifg=white ctermbg=39 ctermfg=white


" Higlight links
" --------------------
hi link htmlLink                None
hi link mustacheConditionals    Function
hi link mustacheHelpers         Function
hi link mustacheSection         Function
hi link rustStorage             PreProc

" Vim Bookmarks
" --------------------------------------
highlight BookmarkSign ctermbg=NONE ctermfg=84 guifg=#b0d68b
highlight BookmarkAnnotationSign ctermbg=NONE ctermfg=84 guifg=#b0d68b

" PHP
" --------------------------------------
hi phpIdentifier ctermbg=NONE guifg=#41d989


" Html
" --------------------------------------
" Remove underline for html element within <u></u> tag
highlight link htmlLink text
highlight link htmlBoldUnderline text
highlight link htmlUnderline text


" WhichKey plugin
" --------------------------------------
autocmd FileType which_key highlight WhichKey guibg=#2d2d2d guifg=#f1c66d
autocmd FileType which_key highlight WhichKeySeperator guibg=#2d2d2d guifg=#777777
autocmd FileType which_key highlight WhichKeyDesc guibg=#2d2d2d guifg=#BBBBBB
autocmd FileType which_key highlight WhichKeyFloating guibg=#2d2d2d guifg=255
autocmd FileType which_key highlight WhichKeyGroup guibg=#2d2d2d guifg=255


" Vim coc
" --------------------------------------
" Highlight coc code hint
highlight CocHintSign guifg=#444444
highlight CocInfoFloat guifg=#41d989
highlight CocErrorFloat guifg=#daad8b
highlight CocWarningFloat guifg=#f1c66d
highlight CocHintFloat guifg=#444444


" Autocompletion box color
" --------------------------------------
" Completion item
highlight Pmenu guibg=#1E1E1E guifg=#777777

" Selected item
highlight PmenuSel guibg=#202020 guifg=#AAAAAA

" Scroll bar
highlight PmenuSbar guibg=#444444

" Scrollbar marker
highlight PmenuThumb guibg=#f1c66d

"highlight VertSplit guibg
highlight VertSplit guibg=bg guifg=#555555

