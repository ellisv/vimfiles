Installation
============

* Clone the repo: `git clone https://github.com/EllisV/vimfiles.git ~/.vim`
* Run: `make`

Requirements
============

* Vim 7.3.598+ with python2 or python3 support
* Python
* [silversearcher-ag](https://github.com/ggreer/the_silver_searcher)
* [FZF](https://github.com/junegunn/fzf)
* Eclipse Mars (if you want to use Eclim)
* `instant-markdown-d`. Install it with `npm install -g instant-markdown-d`

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
