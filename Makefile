VIM = nvim

.PHONY: all
all: projects/init.vim plugged

.PHONY: clean
clean:
	rm -f autoload/plug.vim
	rm -rf plugged

plugged: autoload/plug.vim plugs/*
	$(VIM) -u .vimrc +PlugInstall +qall
	touch plugged

autoload/plug.vim:
	mkdir -p $(dir $@)
	curl -o $@ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

projects/init.vim:
	cp -n projects/init.vim.dist projects/init.vim

.PHONY: update
update:
	$(VIM) -u .vimrc +PlugUpdate +qall
