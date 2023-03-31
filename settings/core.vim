" Appearance {{{
    " Airline {{{
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#tab_nr_type = 1
        let g:airline_theme = 'wombat'
        let g:airline_powerline_fonts = 0
    " }}}
" }}}

" GIT support {{{
    " Fugitive {{{
        " http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database
        " delete fugitive buffers when we leave them
        autocmd BufReadPost fugitive://* set bufhidden=delete
        autocmd BufReadPost fugitive://*
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <buffer> .. :edit %:h<CR> |
        \ endif
    " }}}
" }}}

" Search {{{
    " AG {{{
        let g:ag_prg='ag -U --hidden --column --ignore tags --ignore tags.vendors --ignore-dir var/logs --ignore-dir var/cache --ignore-dir node_modules/.cache --ignore-dir .git'
        nmap ,ag :Ag ""<Left>
    " }}}
" }}}

" Project navigation {{{
    " NERDTree {{{
        let NERDTreeShowHidden = 1                                              " Show hidden files
        let NERDTreeIgnore = ['^\.git$', '\.pyc$', '__pycache__', '.DS_Store']  " Hide matches in NERDTree
        let NERDTreeMinimalUI = 1
        let g:NERDTreeMinimalMenu = 1

        let g:nerdtree_tabs_open_on_gui_startup = 0 " Auto open nerd tree on startup
        let g:nerdtree_tabs_focus_on_files = 1      " Focus in the main content window
    " }}}

    " CTRLP {{{
        if executable('ag')
            " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
            let g:ctrlp_user_command = 'ag %s --files-with-matches -U -g "" --ignore "\.git$"'

            " ag is fast enough that CtrlP doesn't need to cache
            let g:ctrlp_use_caching = 0
        endif

        " Disable default mapping, this is because we prefer fzf.vim instead.
        " We can not get rid of this because we still like to use CtrlPFunky and
        " CtrlPModified.
        let g:ctrlp_map = ''
        let g:ctrlp_by_filename = 1        " Default to filename searches
        let g:ctrlp_extensions = ['funky'] " CtrlP extensions

        nnoremap <Leader>b :CtrlPBuffer<CR> " Alias for opening buffer list

        " Funky search keys
        nnoremap <Leader>fu :CtrlPFunky<Cr>
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

        " CtrlP-Modified keys
        map <Leader>m :CtrlPModified<CR>
        map <Leader>M :CtrlPBranch<CR>
    " }}}

    " FZF {{{
        nnoremap <c-p> :Files<CR>
        "nnoremap <Leader>b :Buffers<CR>
    " }}}
" }}}

" Editing {{{
    let g:AutoPairsCenterLine = 0
" }}}
