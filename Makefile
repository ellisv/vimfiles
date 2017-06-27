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

plugged: autoload/plug.vim plugs/*
	vim -u .vimrc +PlugInstall +qall
	touch plugged

autoload/plug.vim:
	mkdir -p autoload
	wget https://raw.github.com/junegunn/vim-plug/master/plug.vim -O autoload/plug.vim

projects/init.vim:
	cp -n projects/init.vim.dist projects/init.vim

${YCMLIB}:
	$(YCMC) $(YCMFLAGS)

update:
	vim -u .vimrc +PlugUpdate +qall

compile-ycm:
	$(YCMC) $(YCMFLAGS)

.PHONY: update compile-ycm
