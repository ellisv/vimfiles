Installation
============

* Clone the repo: `git clone https://github.com/EllisV/vimfiles.git ~/.vim`
* Run: `make first-install`

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
