VIM = vim

.PHONY: all
all: $(HOME)/.vimrc projects/init.vim plugged

.PHONY: init-nvim
init-nvim: $(HOME)/.config/nvim/init.vim

.PHONY: clean
clean:
	rm -f autoload/plug.vim
	rm -rf plugged

$(HOME)/.vimrc:
	ln -s $(PWD)/.vimrc $(HOME)/.vimrc

$(HOME)/.config/nvim/init.vim:
	ln -s $(PWD)/nvim-init.vim $@

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
