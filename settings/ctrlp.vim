if exists('g:ctrlp_user_command')
    unlet g:ctrlp_user_command
endif
if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command =
        \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$\|\.idea$"'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
else
    " Fall back to using git ls-files if Ag is not available
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.idea$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
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
