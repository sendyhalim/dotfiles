" Load Plugins
"-------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete plugin
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'SirVer/ultisnips'                       " Code snippets
Plug 'Townk/vim-autoclose'                    " Plugin for autoclose brace () {}
Plug 'Yggdroot/indentLine'                    " Indentation hint
Plug 'airblade/vim-gitgutter'                 " Shows a git diff in the 'gutter' (sign column)
Plug 'brooth/far.vim'
Plug 'christoomey/vim-tmux-navigator'         " To navigate between panes seamessly in vim
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'          " Vim will read .editorconfig and set the configuration based on it
Plug 'embear/vim-localvimrc'                  " Load local vimrc if exist (Will override global vimrc)
Plug 'fholgado/minibufexpl.vim'               " Using it for deleting buffer
Plug 'godlygeek/tabular'                      " Automatic alignment
Plug 'gregsexton/MatchTag'                    " Highlight matched tag
Plug 'honza/vim-snippets'                     " Collection of snippets for ultisnipes
Plug 'jceb/vim-orgmode'
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
Plug 'terryma/vim-multiple-cursors'           " Multiple selection just like in sublime Ctrl + d selection
Plug 'tmhedberg/matchit'                      " Jump between matched tags
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'                     " Plugin for git inside vim
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'                     " Insert text in surrounding selected text
Plug 'vim-airline/vim-airline'                " Beautiful status bars
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'                               " Asynchronous linter FTW!
Plug 'Chiel92/vim-autoformat'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-sayonara'                     " Smart buffer/window deletion

" Haskell
" -----------------------------------------------
Plug 'neovimhaskell/haskell-vim'        " Syntax highlighting and indentation for Haskell and Cabal
Plug 'eagletmt/neco-ghc'                " Haskell autocomplete
Plug 'nbouscal/vim-stylish-haskell', { 'do': 'stack install stylish-haskell' }

" Swift
" -----------------------------------------------
Plug 'keith/swift.vim'                  " Swift syntax and indent files
Plug 'mitsuse/autocomplete-swift'

" Elm
" -----------------------------------------------
Plug 'ElmCast/elm-vim'

" Toml
" -----------------------------------------------
Plug 'cespare/vim-toml'                 " TOML syntax highlighting

" Elixir
" -----------------------------------------------
Plug 'elixir-lang/vim-elixir'

" Typescript
" -----------------------------------------------
Plug 'HerringtonDarkholme/yats.vim'     " Typescript syntax highlighting
Plug 'tasn/vim-tsx'                     " Typescript + React Native syntax highlighting
Plug 'mhartington/nvim-typescript'      " Typescript autocompletion

" Golang
" -----------------------------------------------
Plug 'fatih/vim-go'                     " Go programming language

" Rust
" -----------------------------------------------
Plug 'wting/rust.vim'                   " Rust syntax highlighting

" Kotlin
" -----------------------------------------------
Plug 'udalov/kotlin-vim'                " Kotlin syntax highlighting

" Javascript
" -----------------------------------------------
Plug 'moll/vim-node'                    " Node plugin
Plug 'mxw/vim-jsx'                      " React JSX plugin
Plug 'pangloss/vim-javascript'          " Javascript indentation + Syntax
Plug 'elzr/vim-json'

" PHP
" -----------------------------------------------
Plug 'StanAngeloff/php.vim'             " PHP Syntax highlighting
Plug 'xsbeats/vim-blade'                " Laravel blade syntax highlighting

" HTML + CSS + Less + Templating
" -----------------------------------------------
Plug 'groenewege/vim-less'              " Less syntax highlighting
Plug 'mustache/vim-mustache-handlebars' " Highlight handlebars
Plug 'mattn/emmet-vim'                  " Emmet plugin

" Writings
" -----------------------------------------------
Plug 'junegunn/goyo.vim'                " Distraction free mode
Plug 'junegunn/limelight.vim'


" If error with airline, reinstall airline to fix
" Clone https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher first
" Copy fonts in patched-fonts folder to ~/.fonts
Plug 'ryanoasis/vim-devicons'           " If error with airline, reinstall airline to fix

" Colorschemes
"------------------------------------------------
Plug 'flazz/vim-colorschemes'
Plug 'ajh17/Spacegray.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'yamafaktory/lumberjack.vim'
Plug 'Junza/Spink'
Plug 'cseelus/vim-colors-clearance'
Plug 'mhartington/oceanic-next'
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'

" Add plugins to &runtimepath
call plug#end()

" Plugin Settings
" ====================
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
let g:indentLine_color_gui = '#555555'
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

" YouCompleteMe
" --------------------
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Deoplete
" --------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1 " For relative filelist autocomplete

" Prevent autocompletion to be trimmed
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Fix issues between YouCompleteMe/Deoplete/any completion plugin with UltiSnips
"------------------------------------------------
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
let g:NERDTreeIgnore = ['.git[[dir]]', '.idea[[dir]]']
let g:NERDSpaceDelims = 1

" NerdCommenter
" --------------------
let g:NERDCustomDelimiters = {
  \ 'haskell': { 'left': '--', 'right': '' }
\ }

" Airline
" --------------------
" Go to https://github.com/powerline/fonts if airline fonts is ugly
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:tender_airline = 1
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ 't'  : 'T',
  \ }


" Vim web dev icons
" --------------------
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_airline_tabline = 0

" Minibuffer explorer
" --------------------
let g:miniBufExplorerAutoStart = 0         "Just need the command :MBEbd to close current buffer and retain NERDTree

" Vim emmet
" --------------------
let g:user_emmet_leader_key='\'

" Ale
" --------------------
let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" By default, all available tools for all supported languages will be run.
" PHP Pear sucks, let's use phpcs, shall we?
let g:ale_linters = {
\   'php': ['phpcs'],
\}


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

inoremap <c-x><c-k> <c-x><c-k>

" Vim multiple cursor
" --------------------

" Fixing conflict with multiple cursors where
" deoplete inserts '<Plug>bla bla' when multiple cursors are active
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" Vim JSX
" --------------------
" By default, JSX syntax highlighting and indenting will be enabled only
" for files with the .jsx extension, we want syntax highlighting in .js files
" too
let g:jsx_ext_required = 0


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

