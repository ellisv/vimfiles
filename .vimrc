" Activate pathogen
call pathogen#infect()

" Vim settings
set nocompatible
set notimeout
set ttimeout
set timeoutlen=100
set updatetime=1000

" Colors
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized
set background=dark

" Default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Centralize backups and swapfiles
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" Undo settings
if v:version >= 703
    set undodir=~/.vim/undofiles
    set undofile

    set colorcolumn=+1 " Mark the ideal max text width
endif

" Source project specific config files
runtime! projects/**/*.vim
