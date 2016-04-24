" Appearance {{{
    Plug 'tomasr/molokai'
    Plug 'godlygeek/csapprox'
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" }}}

" GIT support {{{
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
" }}}

" Search {{{
    Plug 'rking/ag.vim'
    Plug 'Lokaltog/vim-easymotion'
" }}}

" Project navigation {{{
    Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'
    Plug 'ctrlpvim/ctrlp.vim' | Plug 'jasoncodes/ctrlp-modified.vim' | Plug 'tacahiroy/ctrlp-funky'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
" }}}

" Editing {{{
    Plug 'editorconfig/editorconfig-vim'
    Plug 'Raimondi/delimitMate'
    Plug 'AndrewRadev/splitjoin.vim' " gJ gS
    Plug 'terryma/vim-multiple-cursors'

    " Surroundings {{{
        Plug 'tpope/vim-surround' " E.g. cs{(
        Plug 'briandoll/change-inside-surroundings.vim' " E.g. ci(
    " }}}
" }}}
