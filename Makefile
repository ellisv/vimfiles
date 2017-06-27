YCMC := plugged/YouCompleteMe/install.py
YCMFLAGS := "--clang-completer" "--tern-completer"
YCMLIB := plugged/YouCompleteMe/third_party/ycmd/ycm_core.so

all: $(HOME)/.vimrc projects/init.vim plugged $(YCMLIB)

clean:
	rm -f autoload/plug.vim
	rm -rf plugged

.PHONY: all clean

$(HOME)/.vimrc:
	ln -s $(PWD)/.vimrc $(HOME)/.vimrc

plugged: autoload/plug.vim
	vim -u .vimrc +PlugInstall +qall

projects/init.vim:
	cp -n projects/init.vim.dist projects/init.vim

autoload/plug.vim:
	mkdir -p autoload
	wget https://raw.github.com/junegunn/vim-plug/master/plug.vim -O autoload/plug.vim

$(YCMLIB): plugged
	$(YCMC) $(YCMFLAGS)

install:
	vim -u .vimrc +PlugInstall +qall

update:
	vim -u .vimrc +PlugUpdate +qall

compile-ycm: plugged
	$(YCMC) $(YCMFLAGS)

.PHONY: install update compile-ycm
