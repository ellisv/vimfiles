YCMC := plugged/YouCompleteMe/install.py
YCMFLAGS := "--clang-completer" "--tern-completer"
YCMLIB := plugged/YouCompleteMe/third_party/ycmd/ycm_core.so

.PHONY: all
all: $(HOME)/.vimrc projects/init.vim plugged $(YCMLIB)

.PHONY: clean
clean:
	rm -f autoload/plug.vim
	rm -rf plugged

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

.PHONY: update
update:
	vim -u .vimrc +PlugUpdate +qall

.PHONY: compile-ycm
compile-ycm:
	$(YCMC) $(YCMFLAGS)
