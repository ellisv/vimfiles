" General {{{
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
    Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }

    " Snippets {{{
        Plug 'sniphpets/sniphpets', { 'for': 'php' }
        Plug 'sniphpets/sniphpets-common', { 'for': 'php' }
        Plug 'sniphpets/sniphpets-symfony', { 'for': ['php', 'twig'] }
        Plug 'sniphpets/sniphpets-doctrine', { 'for': 'php' }
    " }}}
" }}}

" JavaScript {{{
    Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    Plug 'mxw/vim-jsx', { 'for': 'javascript' }
    Plug 'moll/vim-node', { 'for': 'javascript' }
" }}}

" TypeScript {{{
    Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" }}}

" Terraform {{{
    Plug 'hashivim/vim-terraform'
" }}}
