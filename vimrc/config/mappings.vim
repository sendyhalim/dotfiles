" https://www.reddit.com/r/vim/comments/39jtib/what_is_the_difference_between_mapleader_and/
" Basically if someone says <LocalLeader> then it will use
" the key in `maplocalleader`, otherwise <Leader> maps to key in `mapleader`
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" Map <C-w> to <Space>
nnoremap <silent> <leader>w <C-w>

" Remap :w<CR> to Ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>a

" Press F3 to check current element highlight-group
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Close current buffer
nnoremap QQ :Sayonara <CR>

noremap L g_
noremap H ^

" use \" and \- to resize vertical splits
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Press F5 to open a list of opened buffers and press <Enter> to open it
nnoremap <F5> :buffers<CR>:buffer<Space>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

nnoremap <silent> <C-q> :FZF<CR>

" Ctrl + L || Ctrl + H to scroll horizontally
nmap <C-L> 5zl
nmap <C-H> 5zh

" Tmux navigator key mapping
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>

" Comment toggle on normal mode with Ctrl+C
nmap <C-c> \c<space>

" Ctrl+c = copy | Ctrl+v = paste
" Only works in visual and insert mode to avoid conflict to visual-block key
" <C-v> in normal mode
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Mapping to move lines
" The command :m .+1 (which can be abbreviated to :m+)
" moves the current line to after line number .+1 (current line number + 1).
" That is, the current line is moved down one line.
" The command :m .-2 (which can be abbreviated to :m-2)

" moves the current line to after line number .-2 (current line number − 2).
" That is, the current line is moved up one line.

" After visually selecting some lines, entering :m '>+1
" moves the selected lines to after line number '>+1 (one line after the last selected line;
" '> is a mark assigned by Vim to identify the selection end).
" That is, the block of selected lines is moved down one line.

" The == re-indents the line to suit its new position.
" For the visual-mode mappings, gv reselects the last visual block and = re-indents that block.
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <F6> :NumbersToggle<CR>
nnoremap <F7> :NumbersOnOff<CR>
nnoremap <F8> :call NERDTreeToggleInCurrentDirectory()<CR>
nnoremap <F9> :TagbarToggle<CR>
" Copy relative filepath (based on cwd) of current buffer
nnoremap <F10> :let @+ = expand("%")<CR>
nnoremap <F12> :call CloseHiddenBuffers()<CR>

" For easier understanding: basically <Plug> is an alias to another mapping
" so we need to use `nmap` instead of `nnoremap` because we want
" `gd` to be mapped to `(coc-definition)` and `(coc-definition)` to another
" mapping:
" gd -> (coc-definition) -> <some other function expression>
" nnoremap gd <Plug>(coc-definition)
" Somehow `gd` does not work for `coc-rust-analyzer` so we'll just use `ff`.
nnoremap gd :call CocActionAsync('jumpDefinition')<CR>
nnoremap gr :call CocActionAsync('jumpReferences')<CR>


" Use <C-l> for trigger snippet expand.
" inoremap <C-l> <Plug>(coc-snippets-expand)


" Register which_key_map
" ------------------------------------
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>\      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader>\ :<c-u>WhichKey  ','<CR>

let g:which_key_map = {}
let g:which_key_map.m = { 'name': 'Custom Leader Mapping' }

" Git mappings
" ------------------------------------
let g:which_key_map.m.g = {
  \ 'name' : 'Git',
  \ 'c': ['Gc', 'Git Commit'],
  \ 'w': ['Gwrite', 'Git Write'],
  \ 'b': ['Gblame', 'Git Blame'],
  \ 's': ['Gstatus', 'Git Status']
\}

" Language specific mappings
" ------------------------------------
let g:which_key_map.m.l = { 'name': 'Language' }
let g:which_key_map.m.l.p = {
  \ 'name': 'php',
  \ 'b': ['phpactor#ClassExpand()', 'ExpandClass'],
  \ 'c': ['phpactor#CopyFile()', 'Copy file'],
  \ 'd': ['phpactor#GotoDefinition()', 'Go to definition'],
  \ 'e': ['phpactor#mxtractMethod()', 'Extract method'],
  \ 'f': ['phpactor#FindReferences()', 'Find references'],
  \ 'k': ['phpactor#ContextMenu()', 'Menu'],
  \ 'h': ['phpactor#Hover()', 'Hover'],
  \ 'i': ['phpactor#ImportMissingClasses()', 'Import missing classes'],
  \ 'l': ['phpactor#ClassNew()', 'New class'],
  \ 'm': ['phpactor#MoveFile()', 'Move file'],
  \ 'n': ['phpactor#Navigate()', 'Navigate'],
  \ 't': ['phpactor#Transform()', 'Complete implementation'],
  \ 'u': ['phpactor#UseAdd()', 'Import class/trait under cursor'],
\}

let g:which_key_map.i = {
  \ 'name': 'IDE' ,
  \ 'g': {
    \ 'name': 'Navigation',
    \ 'd': ['<Plug>(coc-definition)', 'Go to definition'],
    \ 'y': ['<Plug>(coc-type-definition)', 'Go to type definition'],
    \ 'i': ['<Plug>(coc-implementation)', 'Go to implementation'],
    \ 'r': ['<Plug>(coc-references)', 'Go to references'],
    \ 'n': ['<Plug>(coc-diagnostic-next)', 'Next diagnostic'],
    \ 'p': ['<Plug>(coc-diagnostic-prev)', 'Previous diagnostic'],
  \ },
  \ 'r' : {
    \ 'name': 'Refactor',
    \ 'r': ['<Plug>(coc-rename)', 'Rename symbol'],
  \ },
\}
