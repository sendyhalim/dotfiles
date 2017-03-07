" For base16 colorscheme
let base16colorspace=256

if in_neovim
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
elseif in_terminal
  set t_Co=256
else
  set guioptions -=T              " remove toolbar on gvim
  set guioptions -=r              " remove right-hand scroll bar
  set guioptions -=L              " remove left-hand scroll bar
  set guioptions -=m              " remove menu bar
  set guioptions -=M              " remove menu bar
endif

if in_macvim
  set guifont=DejaVu_Sans_Mono_for_Powerline_Plus_Nerd_File_Types_Mono:h13
else
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

filetype plugin indent on
set background=dark
set wildmenu
set wildmode=longest:list,full
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
syntax enable
colorscheme tender

