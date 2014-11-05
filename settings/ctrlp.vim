let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.idea$\|\log$\|\tmp$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

let g:ctrlp_extensions = ['funky']  " CtrlP extensions

nnoremap <Leader>b :CtrlPBuffer<CR> " Alias for opening buffer list

" Funky search keys
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" CtrlP-Modified keys
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>
