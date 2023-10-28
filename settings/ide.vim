" General {{{
    " Syntastic {{{
        let g:syntastic_php_checkers = ['php', 'phpmd', 'phpcs']
        let g:syntastic_go_checkers = ['go', 'gofmt', 'govet', 'golint', 'gotype']
        let g:syntastic_javascript_checkers = ['eslint']
        let g:syntastic_jsx_checkers = ['eslint']
        let g:syntastic_javascript_eslint_exec = 'node_modules/.bin/eslint'
        let g:syntastic_jsx_eslint_exec = 'node_modules/.bin/eslint'
    " }}}

    " Ultisnips {{{
        let g:UltiSnipsExpandTrigger="<C-j>"
        let g:UltiSnipsJumpForwardTrigger="<C-j>"
        let g:UltiSnipsJumpBackwardTrigger="<C-k>"
    " }}}

    " Vdebug {{{
        let g:vdebug_options = {
            \ 'break_on_open': 0,
            \ 'timeout': 20,
            \ 'ide_key': '',
            \ 'port': 9001,
            \ 'server': '' }
    " }}}
" }}}

" Common {{{
    " JSON {{{
        let g:vim_json_syntax_conceal = 0
    " }}}

    " Instant-Markdown {{{
        let g:instant_markdown_autostart = 0
    " }}}
" }}}

" GoLang {{{
    set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

    " By default syntax-highlighting for Functions, Methods and Structs is
    " disabled. Lets enable them
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    " Execute GoImports on save
    let g:go_fmt_command = "goimports"
" }}}

" PHP {{{
    let g:DisableAutoPHPFolding = 1     " Disable PIV autofolding
" }}}

" JavaScript {{{
    let g:jsx_ext_required = 0
" }}}
