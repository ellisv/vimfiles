nnoremap <silent> <buffer> <cr> :PhpSearchContext<cr>

inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
noremap <Leader>s :call PhpSortUse()<CR>
