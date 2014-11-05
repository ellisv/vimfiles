let g:agprg='ag --column --ignore tags --ignore-dir app/logs --ignore-dir app/cache'
nnoremap <Leader>* :Ag '<cword>'<CR>
nmap ,ag :Ag ""<Left>
nmap ,af :AgFile ""<Left>
