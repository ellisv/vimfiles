" Appearance {{{
    Plug 'tomasr/molokai'
    Plug 'godlygeek/csapprox'
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" }}}

" GIT support {{{
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
" }}}

" Project navigation {{{
    Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs' | Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ctrlpvim/ctrlp.vim' | Plug 'jasoncodes/ctrlp-modified.vim' | Plug 'tacahiroy/ctrlp-funky'
" }}}

" Search {{{
    Plug 'rking/ag.vim' | Plug 'Chun-Yang/vim-action-ag' " gagiw, gagi', gag (in visual)
    Plug 'Lokaltog/vim-easymotion'
" }}}

" Editing {{{
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'AndrewRadev/splitjoin.vim' " gJ gS
    Plug 'terryma/vim-multiple-cursors'

    " Surroundings {{{
        Plug 'tpope/vim-surround' " E.g. cs{(
        Plug 'briandoll/change-inside-surroundings.vim' " E.g. ci(
    " }}}
" }}}
