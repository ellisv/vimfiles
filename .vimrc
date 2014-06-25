" Environment {{{
    set nocompatible        " Only VIM support
    call pathogen#infect()  " Activate pathogen
" }}}

" General {{{
    filetype plugin indent on   " Automatically detect filetypes
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing

    set encoding=utf-8
    set fileencoding=utf-8
    scriptencoding utf-8

    " Automatically switch to current dir on buffer change
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

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
" }}}

" UI {{{
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
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys for wrapping
    set scrolljump=5                " Lines to scroll when cursor off-screen
    set scrolloff=3                 " Minimum lines to keep above or below
                                    " cursor
    set foldenable                  " Auto fold code

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

" Key (re)mappings {{{
    let mapleader = ','     " Map leader

    " Wrapped lines goes up/down to next row, rather than next line in file
    " noremap j gj
    " noremap k gk
    " noremap <Up> gk
    " noremap <Down> gj

    nmap <silent> <leader>/ :set invhlsearch<CR> " Hide search highlights
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>    " Find merge conflict markers

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null
" }}}

" Centralize backups, undos, swaps {{{
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
" }}}

" Plugins {{{

    " fugitive {{{

        " http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database
        " delete fugitive buffers when we leave them
        autocmd BufReadPost fugitive://* set bufhidden=delete
        autocmd BufReadPost fugitive://*
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <buffer> .. :edit %:h<CR> |
        \ endif

    " }}}

    " vim-airline {{{
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_theme = 'solarized'
        let g:airline_left_sep='›'  " Slightly fancier than '>'
        let g:airline_right_sep='‹' " Slightly fancier than '<'
    " }}}

" }}}
