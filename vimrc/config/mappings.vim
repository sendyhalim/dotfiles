let mapleader = ' '

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

" Leader guides
" --------------------
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:lmap =  {}

" Git mapping
let g:lmap.g = {
  \ 'name' : 'Git',
  \ 'c': ['Gcommit', 'Git Commit'],
  \ 'w': ['Gwrite', 'Git Write'],
  \ 'b': ['Gblame', 'Git Blame'],
  \ 's': ['Gstatus', 'Git Status']
\}
