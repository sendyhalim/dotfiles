" For base16 colorscheme
let base16colorspace=256

filetype plugin indent on
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
set t_ut=
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set background=dark
set wildmenu
set wildmode=longest:list,full
set modifiable                  " Enable to modify filesystem through vim's native file browser
set cursorline                  " Highlight current line
set autoindent                  " Enables auto indentation
set colorcolumn=80              " Show vertical ruler that at the 80th column
set completeopt-=preview        " Remove window information hint (on top of main window) after we use tab when autocomplete pops out
set copyindent                  " Copy the previous indentation on autoindenting
set encoding=utf-8
set expandtab                   " Indentation using space
set foldlevelstart=20           " Open 20 folds when first time opening a file
set foldmethod=indent
set formatoptions+=t
set hidden                      " Do not delete undo history when switching between buffers
set hlsearch                    " Highlight search terms
set lazyredraw
set linebreak
set linespace=2                 " Space between lines
set nobackup
set nocompatible
set nolist
set noswapfile
set nowrap
set number                      " Turn on number lines
set ruler                       " Enables rule<LeftMouse>
set shiftwidth=2                " number of spaces to use for autoindenting
set showcmd                     " Show command on pressing keystrokes
set ignorecase                  " In order for smartcase to work, we need to set ignorecase
set smartcase
set splitbelow                  " Set open new split panes to right and bottom, which feels more natural than Vim’s default
set splitright
set tabstop=2                   " Set tab size to 2
set textwidth=0
set timeoutlen=300
set wrapmargin=0
set guicursor=                  " https://github.com/neovim/neovim/issues/6403#issuecomment-326725288
syntax enable
colorscheme tender

