" Load Plugins
"-------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Townk/vim-autoclose'                    " Plugin for autoclose brace () {}
Plug 'Yggdroot/indentLine'                    " Indentation hint
Plug 'airblade/vim-gitgutter'                 " Shows a git diff in the 'gutter' (sign column)
Plug 'brooth/far.vim'
Plug 'christoomey/vim-tmux-navigator'         " To navigate between panes seamessly in vim
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'          " Vim will read .editorconfig and set the configuration based on it
Plug 'fholgado/minibufexpl.vim'               " Using it for deleting buffer
Plug 'godlygeek/tabular'                      " Automatic alignment
Plug 'gregsexton/MatchTag'                    " Highlight matched tag
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'                      " Plugin for showing functions and vars description
Plug 'mileszs/ack.vim'                        " For searching, install http://beyondgrep.com/install first
Plug 'myusuf3/numbers.vim'                    " Relative number line
Plug 'scrooloose/nerdcommenter'               " Commenter
Plug 'scrooloose/nerdtree'                    " Plugin for listing directory structure
Plug 'mg979/vim-visual-multi', { 'branch': 'test' }
Plug 'tmhedberg/matchit'                      " Jump between matched tags
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'                     " Plugin for git inside vim
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'                     " Insert text in surrounding selected text
Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/lsp-status.nvim'               " Utility functions to get  lsp statuses
Plug 'Chiel92/vim-autoformat'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-sayonara'                     " Smart buffer/window deletion
Plug 'plasticboy/vim-markdown'                " Markdown syntax highlighting
Plug 'RRethy/vim-illuminate'                  " Highlight same variable under cursor
Plug 'AndrewRadev/splitjoin.vim'
Plug 'liuchengxu/vim-which-key'               " Guided nested leader mappings

" Task management
" -----------------------------------------------
Plug 'jceb/vim-orgmode'                       " Check https://github.com/jceb/vim-orgmode/blob/master/doc/orgguide.txt#L241
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/utl.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Lua
" -----------------------------------------------
Plug 'tbastos/vim-lua'

" Haskell
" -----------------------------------------------
Plug 'neovimhaskell/haskell-vim'        " Syntax highlighting and indentation for Haskell and Cabal
Plug 'nbouscal/vim-stylish-haskell', { 'do': 'stack install stylish-haskell' }

" Toml
" -----------------------------------------------
Plug 'cespare/vim-toml'                 " TOML syntax highlighting

" Golang
" -----------------------------------------------
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rust
" -----------------------------------------------
Plug 'rust-lang/rust.vim'    " Rust syntax highlighting

" Javascript
" -----------------------------------------------
Plug 'pangloss/vim-javascript'          " Javascript indentation + Syntax
Plug 'elzr/vim-json'
Plug 'hjson/vim-hjson'                  " Highlight hjson filetype

" PHP
" -----------------------------------------------
Plug 'xsbeats/vim-blade'                " Laravel blade syntax highlighting
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'} " PHP Refactor tool


" HTML + CSS + Less + Templating
" -----------------------------------------------
Plug 'groenewege/vim-less'              " Less syntax highlighting
Plug 'mustache/vim-mustache-handlebars' " Highlight handlebars
Plug 'mattn/emmet-vim'                  " Emmet plugin


" Colorschemes
" ------------------------------------------------
Plug 'flazz/vim-colorschemes'
Plug 'gosukiwi/vim-atom-dark'
Plug 'cseelus/vim-colors-clearance'
Plug 'mhartington/oceanic-next'
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'

" Force vim to change working dir nearest to git repo
Plug 'airblade/vim-rooter'

" Protobuf stuffs
"------------------------------------------------
Plug 'uber/prototool', { 'rtp':'vim/prototool' }

" Add plugins to &runtimepath
call plug#end()

" Plugin Settings
" ====================
" Rust.vim
" --------------
let g:rustfmt_autosave = 1

" Vim Far
" --------------
let g:far#source = 'agnvim'

" FZF
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Set completion output box layout position to be at the bottom
let g:fzf_layout = { 'down': '~25%' }

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

" Vim org mode
" --------------
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'component_function': {
  \   'lsp_status': 'LspStatus',
  \ },
\ }

" See https://github.com/itchyny/lightline.vim/blob/master/doc/lightline.txt#L67-L79
" `modified` is basically whether the current change in the file is modified but not saved.
let g:lightline.active = {
  \ 'left': [ [ 'mode', 'paste' ],
  \           [ 'readonly', 'filename', 'modified' ] ],
  \ 'right': [ [ 'fileencoding', 'filetype' ], [ 'lsp_status'] ],
\ }

let g:lightline.inactive = {
  \ 'left': [ [ 'filename' ] ],
  \ 'right': [ ]
\ }

let g:lightline.tabline = {
  \ 'left': [ [ 'tabs' ] ],
  \ 'right': [ ]
\ }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" vim-which-key
" ---------------------
" Add 1 more space to the left
let g:which_key_floating_opts = { 'width': '-1', 'col': '+1' }

" Vim org mode
" ---------------------
" Automatically indent text under heading
let g:org_indent = 1

" Disable heading star "*" concealling
let g:org_heading_shade_leading_stars = 0
let g:org_todo_keywords = ['TODO(1)', 'DOING(2)', 'DELEGATED(3)', '|', 'MASTER(4)', 'STAGING(5)', 'PRODUCTION(6)', 'DONE(7)']
let org_prefer_insert_mode = 0

" Vim visual multi
" --------------------
let g:VM_sublime_mappings = 0
let g:VM_maps = {}
let g:VM_maps['Visual Cursors'] = ''

" Vim autoclose
" --------------------

" Fix autoclose, we need to press <ESC> twice when autocompletion pops out
" with this code we don't need to press <ESC> or 'ctrl + [' twice
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" Vim easy motion
" --------------------
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" Vim indent lines
" --------------------
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#373737'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'

" Vim Bookmarks
" --------------------
nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ma <Plug>BookmarkShowAll
nmap <Leader>mj <Plug>BookmarkNext
nmap <Leader>mk <Plug>BookmarkPrev
nmap <Leader>mc <Plug>BookmarkClear
nmap <Leader>mx <Plug>BookmarkClearAll

" These will also work with a [count] prefix
nmap <Leader>mkk <Plug>BookmarkMoveUp
nmap <Leader>mjj <Plug>BookmarkMoveDown
nmap <Leader>mg <Plug>BookmarkMoveToLine

" Fugitive
" --------------------
command -bar -bang -nargs=* Gc :Gcommit<bang> -v <args>

" Vim haskell syntax highlighting
let g:haskell_enable_quantification = 1   " Enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " Enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " Enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " Enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " Enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " Enable highlighting of `static`
let g:haskell_backpack = 1                " Enable highlighting of backpack keywords

" Vim handlebars
" --------------------
let g:mustache_abbreviations = 1

" vim-go
" --------------------
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


" NerdTree
" --------------------
let g:NERDTreeShowHidden = 1
let g:NERDTreeSortOrder = ['\/$', '*', '\.toml']
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['.git$[[dir]]', '.idea$[[dir]]']
let g:NERDSpaceDelims = 1

" NerdCommenter
" --------------------
let g:NERDCustomDelimiters = {
  \ 'haskell': { 'left': '--', 'right': '' }
\ }

" Minibuffer explorer
" --------------------
let g:miniBufExplorerAutoStart = 0         "Just need the command :MBEbd to close current buffer and retain NERDTree

" Vim emmet
" --------------------
let g:user_emmet_leader_key='\'

" Vim Javascript
" --------------------
let g:javascript_plugin_jsdoc = 1 " Highlight jsdoc
let g:javascript_plugin_flow = 1 " Highlight facebook's flow

" Vim JSON
" --------------------
let g:vim_json_syntax_conceal = 0 " Disable concealing

" Tmux navigator
" --------------------
let g:tmux_navigator_no_mappings = 1

" Ulti snip
" --------------------
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Setup custom snippet dir
" https://github.com/SirVer/ultisnips/issues/948#issuecomment-571907338
let $HOME = expand('~')
let g:UltiSnipsSnippetsDir = $HOME."~/.vim/config/ultisnips"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/config/ultisnips']

" Vim markdown
let g:vim_markdown_conceal = 0

inoremap <c-x><c-k> <c-x><c-k>

" Vim ack
" --------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Vim JSX
" --------------------
" By default, JSX syntax highlighting and indenting will be enabled only
" for files with the .jsx extension, we want syntax highlighting in .js files
" too
let g:jsx_ext_required = 0

" Vim rest console
let g:vrc_curl_opts = {
  \ '--verbose': '',
\}

" Open NERDTree in the directory of the current
" file (or /home if no file is open)
" -----------------------------------------------
function! NERDTreeToggleInCurrentDirectory()
  if (expand('%') == '')
    " No buffer is opened, just toggle nerdtree to open it in the current directory
    exe ":NERDTreeToggle"
  elseif (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    " If NerdTree is already opened
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

" Vim leader guide
" ---------------------------
let g:leaderGuide_hspace = 3
