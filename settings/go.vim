set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow " GoLint after save"
autocmd BufWritePost,FileWritePost *.go execute 'GoVet' | cwindow " GoVet after save

" By default syntax-highlighting for Functions, Methods and Structs is disabled. Lets enable them
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Execute GoImports on save
let g:go_fmt_command = "goimports"
