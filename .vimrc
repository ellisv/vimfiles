" Vundle {{{
    set nocompatible    " be iMproved, required
    filetype off        " required

    " Set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    for fpath in split(globpath('~/.vim/vundles/', '*.vundle'), '\n')
        exe 'source' fpath
    endfor

    " All of plugins must be added before the following line
    call vundle#end()
" }}}

" General {{{
    filetype plugin indent on   " Automatically detect filetypes
    syntax on                   " Syntax highlighting
    set autoread                " Automatically reload files that were changed outside
    set mouse=a                 " Automatically enable mouse usage
    set ttymouse=xterm2
    set mousehide               " Hide the mouse cursor while typing

    set encoding=utf-8
    set fileencoding=utf-8
    scriptencoding utf-8

    " Automatically switch to current dir on buffer change
    " autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    " Better Unix / Windows compatibility
    set viewoptions=folds,options,cursor,unix,slash

    set shortmess+=filmnrxoOtT  " Abbrev. of messages (avoids 'hit enter')
    set virtualedit=onemore     " Allow cursor beyond last character
    set history=1000            " Story a ton of history (default is 20)
    " set spell                 " Spell checking on
    set hidden                  " Allow buffer switching without saving

    set notimeout
    set ttimeout
    set timeoutlen=100
    set updatetime=1000

    set clipboard=unnamedplus   " Use default clipboard
" }}}

" UI {{{
    colorscheme solarized           " Use solarized color scheme
    set t_Co=256                    " Terminal support for 256 colors
    set background=dark             " Dark scheme
    let g:solarized_termcolors=256  " Solarized theme with 256 colors

    set tabpagemax=15               " Show only 15 tabs
    set showmode                    " Display the current mode

    set colorcolumn=121             " Highligh column
    set cursorline                  " Hightlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same
                                    " background color in relative mode

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in
                                    " visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        " set statusline=%<%f\                     " Filename
        " set statusline+=%w%h%m%r                 " Options
        " set statusline+=%{fugitive#statusline()} " Git Hotness
        " set statusline+=\ [%{&ff}/%Y]            " Filetype
        " set statusline+=\ [%{getcwd()}]          " Current dir
        " set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra space between rows
    set number                      " Display line numbers
    set showmatch                   " Show matching brackets/parenthesis
    set hlsearch                    " Highlight search terms
    set incsearch                   " Find as you type search
    set ignorecase                  " Case insesitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest       " Command <Tab> completion
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys for wrapping
    set scrolljump=5                " Lines to scroll when cursor off-screen
    set scrolloff=3                 " Minimum lines to keep above or below
                                    " cursor
    set nofoldenable                " Disable code folding

    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

    set splitright      " Puts new vsplit windows to the right of the current
    set splitbelow      " Puts new split windows to the bottom of the current
" }}}

" Formatting {{{
    set wrap                " Wrap long lines
    set linebreak           " Wrap lines at convenient points
    set autoindent          " Indent at the same level of previous line
    set shiftwidth=4        " Use indents of 4 spaces
    set expandtab           " Tabs are spaces
    set tabstop=4           " An indentation every four columns
    set softtabstop=4       " Let backspace delete indent
    set smartindent         " Automatically inserts one extra level of
                            " indentation in some cases
    set pastetoggle=<F12>   " Sane indentation on pastes
" }}}

" Centralize undofiles and disable backups {{{
    set noswapfile
    set nobackup
    set nowb

    " Undo settings
    if has('persistent_undo')
        set undodir=~/.vim/undofiles
        set undofile
    endif
" }}}

" Key (re)mappings {{{
    source ~/.vim/keyconfig.vim
" }}}

" Settings {{{
    for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
        exe 'source' fpath
    endfor
" }}}
