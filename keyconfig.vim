let mapleader = ','     " Map leader

" Wrapped lines goes up/down to next row, rather than next line in file
" noremap j gj
" noremap k gk
" noremap <Up> gk
" noremap <Down> gj

nmap <silent> <leader>/ :set invhlsearch<CR> " Hide search highlights
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>    " Find merge conflict markers

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

cmap !! VimuxRunCommand ""

nnoremap <Leader>nt :NERDTree<CR>       " Open NERDTree

" If you visually select something and hit paste
" that thing gets yanked into your buffer. This
" generally is annoying when you're copying one item
" and repeatedly pasting it. This changes the paste
" command in visual mode so that it doesn't overwrite
" whatever is in your paste buffer.
vnoremap p "_dP"
