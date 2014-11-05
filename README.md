Installation
============

Clone the repo:
`git clone https://github.com/EllisV/vimfiles.git ~/.vim`

Grab Vundle by submodules:
`cd ~/.vim && git submodule init && git submodule update`

Make sure vim finds the vimrc file by either symlinking it:
`ln -s ~/.vim/.vimrc ~/.vimrc`

or by sourcing it from  your own ~/.vimrc:
`source ~/.vim/.vimrc`

Install specified plugins by running:
`vim +PluginInstall +qall`

Compile YouCompleteMe by running:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

If you want semantic C# support, you should add `--omnisharp-completer` to the install script as well.

Requirements
============

This configuration requires Vim 7.3.885+ compiled with [if\_lua](http://vimdoc.sourceforge.net/htmldoc/if_lua.html) and [silversearcher-ag](https://github.com/ggreer/the_silver_searcher).
To check if your VIM has lua type in `:echo has("lua")`.

## Debian (or Ubuntu)

Make sure you have any of these packages:
* vim-nox
* vim-gtk
* vim-gnome
* vim-athena

For installing silversearcher-ag use `sudo apt-get install silversearcher-ag`

## Mac OS X

    brew install macvim --with-cscope --with-lua --HEAD
    brew install the_silver_searcher
