let g:ag_prg='ag --column --ignore tags --ignore-dir app/logs --ignore-dir app/cache'
nnoremap <Leader>* :Ag '<cword>'<CR>
nmap ,ag :Ag ""<Left>
nmap ,af :AgFile ""<Left>
