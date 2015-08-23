" General key mappings
nmap <leader>r <Plug>(go-run)
nmap <c-x>b <Plug>(go-build)
nmap <leader>t <Plug>(go-test)
nmap <leader>c <Plug>(go-coverage)
nmap <Leader>s <Plug>(go-implements)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>e <Plug>(go-rename)

" Go to definition mappings
nmap <Leader>ds <Plug>(go-def-split)
nmap <Leader>dv <Plug>(go-def-vertical)
nmap <Leader>dt <Plug>(go-def-tab)

" Doc mappings
nmap <Leader>gd <Plug>(go-doc)
nmap <Leader>gv <Plug>(go-doc-vertical)
nmap <Leader>gb <Plug>(go-doc-browser)

" Go Import
nmap <Leader>u <Plug>(go-import)
inoremap <Leader>u <Left><C-O>:execute "normal \<Plug>(go-import)"<Cr><Right>
