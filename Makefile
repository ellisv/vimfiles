all: $(HOME)/.vimrc autoload/plug.vim projects/init.vim compile-ycm install

$(HOME)/.vimrc:
	ln -s $(PWD)/.vimrc $(HOME)/.vimrc

autoload/plug.vim:
	mkdir -p autoload
	wget https://raw.github.com/junegunn/vim-plug/master/plug.vim -O autoload/plug.vim

projects/init.vim:
	cp -n projects/init.vim.dist projects/init.vim

install:
	vim +PlugInstall +qall

update:
	vim +PlugUpdate +qall

compile-ycm:
	plugged/YouCompleteMe/install.py --clang-completer --tern-completer

.PHONY: all install update compile-ycm
