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

nnoremap <c-s> :w<CR>
nnoremap <c-c> :q<CR>
nnoremap <c-x>c :bdelete<CR>

nnoremap <Leader>nt :NERDTreeToggle<CR>         " Open NERDTree
nnoremap <Leader>nf :NERDTreeFind<CR>           " Search for current file in NERDTree

" If you visually select something and hit paste
" that thing gets yanked into your buffer. This
" generally is annoying when you're copying one item
" and repeatedly pasting it. This changes the paste
" command in visual mode so that it doesn't overwrite
" whatever is in your paste buffer.
vnoremap p "_dP"

" The Smash Escape
inoremap jk <Esc>
inoremap kj <Esc>

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Git mapping
nnoremap <c-g><c-s> :Gwrite<CR>
nnoremap <c-g>ll :Gpull<CR>
nnoremap <c-g>sh :Gpush<CR>
nnoremap <c-g>d :Gdiff<CR>
nnoremap gn :GitGutterNextHunk<CR>
nnoremap gp :GitGutterPrevHunk<CR>
nnoremap gu :GitGutterUndoHunk<CR>
nnoremap gs :Gstatus<CR>

" Remap NERDCommenterInvert in order to resolve conflict with
" briandoll/change-inside-surroundings plugin
nmap <C-x>/ <plug>NERDCommenterInvert
xmap <C-x>/ <plug>NERDCommenterInvert

" coc.nvim {{{
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1):
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    nmap <silent> <C-m> <Plug>(coc-cursors-word)
    xmap <silent> <C-m> <Plug>(coc-cursors-range)
    nmap <silent> <C-m> <Plug>(coc-cursors-word)*
    xmap <silent> <C-m> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn

    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
" }}}
