" Environment {
    set nocompatible        " Only VIM support
    call pathogen#infect()  " Activate pathogen
" }

" General {
    filetype plugin indent on   " Automatically detect filetypes
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    " Automatically switch to current dir on buffer change
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    " Better Unix / Windows compatibility
    set viewoptions=folds,options,cursor,unix,slash

    set virtualedit=onemore     " Allow cursor beyond last character
    set history=1000            " Story a ton of history (default is 20)
    " set spell                 " Spell checking on
    set hidden                  " Allow buffer switching without saving

    set notimeout
    set ttimeout
    set timeoutlen=100
    set updatetime=1000
" }

" UI {
    set t_Co=256                    " Terminal support for 256 colors
    set background=dark             " Dark scheme
    let g:solarized_termcolors=256  " Solarized theme with 256 colors
    colorscheme solarized           " Use solarized color scheme

    set tabpagemax=15               " Show only 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Hightlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same
                                    " background color in relative mode

    set linespace=0                 " No extra space between rows
    set number                      " Display line numbers
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set ignorecase                  " Case insesitive search
    set foldenable                  " Auto fold code

    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

    set splitright      " Puts new vsplit windows to the right of the current
    set splitbelow      " Puts new split windows to the bottom of the current
" }

" Formatting {
    set nowrap          " Do not wrap long lines
    set autoindent      " Indent at the same level of previous line
    set shiftwidth=4    " Use indents of 4 spaces
    set expandtab       " Tabs are spaces
    set softtabstop=4   " Let backspace delete indent
    set smartindent     " Automatically inserts one extra level of
                        " indentation in some cases
" }

" Centralize backups, undos, swaps {
    set directory=~/.vim/swaps
    set backupdir=~/.vim/backups

    " Undo settings
    if v:version >= 703
        set undodir=~/.vim/undofiles
        set undofile

        set colorcolumn=+1 " Mark the ideal max text width
    endif

    " Source project specific config files
    runtime! projects/**/*.vim
" }
