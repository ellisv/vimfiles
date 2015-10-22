first-install:
	ln -s ~/.vim/.vimrc ~/.vimrc
	cp -n ~/.vim/projects/init.vim.dist ~/.vim/projects/init.vim
	vim +PlugInstall +qall
	~/.vim/plugged/YouCompleteMe/install.sh --clang-completer

install:
	vim +PlugInstall +qall

update:
	vim +PlugUpdate +qall

compile-ycm:
	~/.vim/plugged/YouCompleteMe/install.sh --clang-completer
