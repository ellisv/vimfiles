" Vundle {{{
    set nocompatible    " be iMproved, required
    filetype off        " required

    " Set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'Valloric/YouCompleteMe'
    Plugin 'scrooloose/nerdtree'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'bling/vim-airline'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'scrooloose/syntastic'
    Plugin 'kien/ctrlp.vim'
    Plugin 'tacahiroy/ctrlp-funky'
    Plugin 'tpope/vim-surround'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'elzr/vim-json'
    Plugin 'pangloss/vim-javascript'
    Plugin 'vim-scripts/smarty-syntax'
    Plugin 'spf13/PIV'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'arnaud-lb/vim-php-namespace'
    Plugin 'joonty/vdebug'
    Plugin 'Raimondi/delimitMate'

    " All of plugins must be added before the following line
    call vundle#end()
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

    nnoremap <Leader>nt :NERDTree<CR>       " Open NERDTree
" }}}

" Centralize backups, undos, swaps {{{
    set directory=~/.vim/swaps
    set backupdir=~/.vim/backups

    " Undo settings
    if v:version >= 703
        set undodir=~/.vim/undofiles
        set undofile
    endif

    " Source project specific config files
    runtime! projects/**/*.vim
" }}}

" Plugins {{{

    " ctrlp {{{
        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.idea$\|\log$\|\tmp$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        let g:ctrlp_extensions = ['funky']  " CtrlP extensions

        nnoremap <Leader>b :CtrlPBuffer<CR> " Alias for opening buffer list

        " Funky search keys
        nnoremap <Leader>fu :CtrlPFunky<Cr>
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    " }}}

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
        let g:airline_theme = 'base16'
        let g:airline_powerline_fonts = 1
    " }}}

    " UltiSnips {{{
        let g:UltiSnipsExpandTrigger="<C-j>"
        let g:UltiSnipsJumpForwardTrigger="<C-j>"
        let g:UltiSnipsJumpBackwardTrigger="<C-k>"
    " }}}

    " PIV {{{
        let g:DisableAutoPHPFolding = 1     " Disable PIV autofolding
    " }}}

    " NERDTree {{{
        let NERDTreeShowHidden = 1          " Show hidden files
        let NERDTreeIgnore = ['\.git$']     " Hide matches in NERDTree
    " }}}

    " Syntastic {{{
        let g:syntastic_php_checkers = ['php', 'phpmd', 'phpcs']
    " }}}

    " PHP-Namespace {{{
        inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
        noremap <Leader>u :call PhpInsertUse()<CR>
    " }}}

" }}}
