" Load Plugins
"-------------------------------------------
call plug#begin('~/.vim/plugged')

" YouCompleteMe only works in linux/Mac OSX
if has('unix')
  Plug 'Valloric/YouCompleteMe'
endif

Plug 'Yggdroot/indentLine'                    " Indentation hint
Plug 'flazz/vim-colorschemes'                 " vim colorschemes
Plug 'fatih/vim-go'                           " Go programming language
Plug 'vim-airline/vim-airline'                " Beautiful status bars
Plug 'vim-airline/vim-airline-themes'
Plug 'fholgado/minibufexpl.vim'               " Using it for deleting buffer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'                      " Distraction free mode
Plug 'scrooloose/nerdtree'                    " Plugin for listing directory structure
Plug 'scrooloose/nerdcommenter'               " Commenter
Plug 'majutsushi/tagbar'                      " Plugin for showing functions and vars description
Plug 'tpope/vim-fugitive'                     " Plugin for git inside vim
Plug 'scrooloose/syntastic'                   " Plugin for error highlighter
Plug 'Townk/vim-autoclose'                    " Plugin for autoclose brace () {}
Plug 'terryma/vim-multiple-cursors'           " Multiple selection just like in sublime Ctrl + d selection
Plug 'pangloss/vim-javascript'                " Javascript indentation + Syntax
Plug 'godlygeek/tabular'                      " Automatic alignment
Plug 'SirVer/ultisnips'                       " Code snippets
Plug 'honza/vim-snippets'                     " Collection of snippets for ultisnipes
Plug 'cespare/vim-toml'                       " TOML syntax highlighting
Plug 'mattn/emmet-vim'                        " Emmet plugin
Plug 'gregsexton/MatchTag'                    " Highlight matched tag
Plug 'tmhedberg/matchit'                      " Jump between matched tags
Plug 'wting/rust.vim'                         " Rust syntax highlighting
Plug 'myusuf3/numbers.vim'                    " Relative number line
Plug 'tpope/vim-surround'                     " Insert text in surrounding selected text
Plug 'groenewege/vim-less'                    " Less syntax highlighting
Plug 'mustache/vim-mustache-handlebars'       " Highlight handlebars
Plug 'mileszs/ack.vim'                        " For searching, install http://beyondgrep.com/install first
Plug 'editorconfig/editorconfig-vim'          " Vim will read .editorconfig and set the configuration based on it
Plug 'xsbeats/vim-blade'                      " Laravel blade syntax highlighting
Plug 'StanAngeloff/php.vim'                   " PHP Syntax highlighting
Plug 'christoomey/vim-tmux-navigator'         " To navigate between panes seamessly in vim
Plug 'embear/vim-localvimrc'                  " Load local vimrc if exist (Will override global vimrc)
Plug 'easymotion/vim-easymotion'
Plug 'eagletmt/neco-ghc'                      " Haskell autocomplete
Plug 'moll/vim-node'                          " Node plugin
Plug 'Shougo/vimproc.vim'
Plug 'ternjs/tern_for_vim'
Plug 'keith/swift.vim'                        " Swift syntax and indent files
Plug 'rhysd/conflict-marker.vim'              " Jump and resolve git conflicts
Plug 'mxw/vim-jsx'                            " React JSX plugin

" If error with airline, reinstall airline to fix
" Clone https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher first
" Copy fonts in patched-fonts folder to ~/.fonts
Plug 'ryanoasis/vim-webdevicons'                  " If error with airline, reinstall airline to fix

" Colorschemes
"------------------------------------------------
Plug 'ajh17/Spacegray.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'yamafaktory/lumberjack.vim'
Plug 'Junza/Spink'
Plug 'cseelus/vim-colors-clearance'
Plug 'mhartington/oceanic-next'
Plug 'jacoborus/tender.vim'


" Add plugins to &runtimepath
call plug#end()

" Plugin Settings
"-------------------------------------------
" Vim indent lines
let g:indentLine_color_term = 0
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_color_term = 0
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'

" Fugitive
command -bar -bang -nargs=* Gc :Gcommit<bang> -v <args>

" Eclim autocomplete with youcompleteme
let g:EclimCompletionMethod = 'omnifunc'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Neco GHC
" Haskell autocompletion using youcompleteme
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1

if in_macvim
  let g:ycm_path_to_python_interpreter = '/usr/bin/python'
endif

" Vim handlebars
let g:mustache_abbreviations = 1

" vim-go
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Ctrl-P
" ignore directories
let g:ctrlp_map = '<c-q>'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|vendor)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<F2>'] }

" NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeSortOrder = ['\/$', '*', '\.toml']
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['.git[[dir]]', '.idea[[dir]]']
let g:NERDSpaceDelims = 1

" Airline
" Go to https://github.com/powerline/fonts if airline fonts is ugly
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:tender_airline = 1
let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#buffer_nr_show = 1

" Vim web dev icons
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_airline_tabline = 0

" Minibuffer explorer
let g:miniBufExplorerAutoStart = 0         "Just need the command :MBEbd to close current buffer and retain NERDTree

" Vim emmet
let g:user_emmet_leader_key='\'

" Syntatic
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_javascript_checkers = ['eslint']
let b:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_always_populate_loc_list = 1  " Always populate loc list so we can use lnext and lprev to jump to errors
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }
let g:syntastic_error_symbol = '×'
let g:syntastic_warning_symbol = '!'

" Tmux navigator
let g:tmux_navigator_no_mappings = 1

" Vim Tern
let g:tern_request_timeout = 3

" Ulti snip
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

inoremap <c-x><c-k> <c-x><c-k>

" Vim JSX
" By default, JSX syntax highlighting and indenting will be enabled only
" for files with the .jsx extension, we want syntax highlighting in .js files
" too
let g:jsx_ext_required = 0

" Fix issues between YouCompleteMe and UltiSnips
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


" Open NERDTree in the directory of the current
" file (or /home if no file is open)
" -----------------------------------------------
function! NERDTreeToggleInCurrentDirectory()
  " If NerdTree is already opened
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
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

