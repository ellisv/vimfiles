" General {{{
    Plug 'Valloric/YouCompleteMe'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/syntastic'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'joonty/vdebug'
" }}}

" Common {{{
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
" }}}

" GoLang {{{
    Plug 'fatih/vim-go', { 'for': 'go' }
" }}}

" PHP {{{
    Plug 'spf13/PIV', { 'for': 'php' }
    Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }

    " Snippets {{{
        Plug 'sniphpets/sniphpets', { 'for': 'php' }
        Plug 'sniphpets/sniphpets-common', { 'for': 'php' }
        Plug 'sniphpets/sniphpets-symfony', { 'for': 'php' }
        Plug 'sniphpets/sniphpets-doctrine', { 'for': 'php' }
    " }}}
" }}}

" JavaScript {{{
    Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    Plug 'mxw/vim-jsx', { 'for': 'javascript' }
    Plug 'itspriddle/vim-jquery', { 'for': 'javascript' }
    Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
    Plug 'moll/vim-node', { 'for': 'javascript' }
    Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
" }}}

" HTML {{{
    Plug 'evidens/vim-twig', { 'for': 'twig' }
    Plug 'mattn/emmet-vim', { 'for': ['html', 'twig'] }
" }}}

" Others {{{
    Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
" }}}
