" Load Plugins
"-------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'SirVer/ultisnips'                       " Code snippets
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
Plug 'honza/vim-snippets'                     " Collection of snippets for ultisnipes
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'                      " Plugin for showing functions and vars description
Plug 'mileszs/ack.vim'                        " For searching, install http://beyondgrep.com/install first
Plug 'myusuf3/numbers.vim'                    " Relative number line
Plug 'rhysd/conflict-marker.vim'              " Jump and resolve git conflicts
Plug 'scrooloose/nerdcommenter'               " Commenter
Plug 'scrooloose/nerdtree'                    " Plugin for listing directory structure
Plug 'slashmili/alchemist.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'mg979/vim-visual-multi', { 'branch': 'test' }
Plug 'tmhedberg/matchit'                      " Jump between matched tags
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'                     " Plugin for git inside vim
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'                     " Insert text in surrounding selected text
Plug 'itchyny/lightline.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-sayonara'                     " Smart buffer/window deletion
Plug 'diepm/vim-rest-console'                 " REST plugin
Plug 'plasticboy/vim-markdown'                " Markdown syntax highlighting
Plug 'RRethy/vim-illuminate'                  " Highlight same variable under cursor
Plug 'AndrewRadev/splitjoin.vim'
Plug 'liuchengxu/vim-which-key'               " Guided nested leader mappings

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Task management
" -----------------------------------------------
Plug 'jceb/vim-orgmode'                       " Check https://github.com/jceb/vim-orgmode/blob/master/doc/orgguide.txt#L241
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/utl.vim'

" Haskell
" -----------------------------------------------
Plug 'neovimhaskell/haskell-vim'        " Syntax highlighting and indentation for Haskell and Cabal
Plug 'eagletmt/neco-ghc'                " Haskell autocomplete
Plug 'nbouscal/vim-stylish-haskell', { 'do': 'stack install stylish-haskell' }

" Toml
" -----------------------------------------------
Plug 'cespare/vim-toml'                 " TOML syntax highlighting

" Elixir
" -----------------------------------------------
Plug 'elixir-lang/vim-elixir'

" Golang
" -----------------------------------------------
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" Rust
" -----------------------------------------------
Plug 'rust-lang/rust.vim'    " Rust syntax highlighting

" Javascript
" -----------------------------------------------
Plug 'moll/vim-node'                    " Node plugin
Plug 'mxw/vim-jsx'                      " React JSX plugin
Plug 'pangloss/vim-javascript'          " Javascript indentation + Syntax
Plug 'elzr/vim-json'

" Java
Plug 'artur-shaik/vim-javacomplete2'

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

" Coc
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-rust-analyzer',
  \ 'coc-phpls',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-snippets',
\]

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

" Vim org mode
" --------------
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \ },
\ }

" See https://github.com/itchyny/lightline.vim/blob/master/doc/lightline.txt#L67-L79
" `modified` is basically whether the current change in the file is modified but not saved.
let g:lightline.active = {
  \ 'left': [ [ 'mode', 'paste' ],
  \           [ 'readonly', 'filename', 'modified' ] ],
  \ 'right': [ [ 'fileencoding', 'filetype' ], [ 'cocstatus' ] ],
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

" Vim Goyo
" --------------------
let g:goyo_width = 140
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Vim Limelight
" --------------------
let g:limelight_conceal_ctermfg = 242


" Vim indent lines
" --------------------
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#373737'
let g:indentLine_leadingSpaceEnabled = 0
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


inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" UltiSnips
" ------------------------------------------------
" Setup custom snippet dir
" https://github.com/SirVer/ultisnips/issues/948#issuecomment-571907338
let $HOME = expand('~')
let g:UltiSnipsSnippetsDir = $HOME."~/.vim/config/snippets"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/config/snippets']

" Fix issues between YouCompleteMe/Deoplete/any completion plugin with UltiSnips
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Neco GHC
" --------------------
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1

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

" Ctrl-P
" --------------------
" ignore directories
let g:ctrlp_map = '<c-q>'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|vendor)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<F2>'] }

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

" Vim Tern
" --------------------
let g:tern_request_timeout = 3

" Ulti snip
" --------------------
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

" Golang tagbar solution
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Vim leader guide
" ---------------------------
let g:leaderGuide_hspace = 3


" Trigger auto-completion with C-space.
" inoremap <silent><expr> <c-space> coc#refresh()
" Make <TAB> select next completion and Shift-<TAB> to select previous.
" function! s:check_back_space() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" inoremap <silent><expr> <TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ <SID>check_back_space() ? "\<TAB>" :
  " \ coc#refresh()
" inoremap <silent><expr> <S-TAB>
  " \ pumvisible() ? "\<C-p>" :
  " \ <SID>check_back_space() ? "\<S-TAB>" :
  " \ coc#refresh()
" " Make <CR> confirm completion.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
