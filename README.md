Vimfiles
========

Installation
------------

* Clone the repo: `git clone https://github.com/ellisv/vimfiles.git ~/.vim`
* Run: `make`

Requirements
------------

* Vim 7.3.598+ with python2 or python3 support
* [silversearcher-ag](https://github.com/ggreer/the_silver_searcher)
* `instant-markdown-d`. Install it with `npm install -g instant-markdown-d`

### Debian (or Ubuntu)

Make sure you have any of these packages:

* vim
* vim-nox
* vim-nox-py2

For installing silversearcher-ag use `sudo apt-get install silversearcher-ag`

### Mac OS X

    brew install macvim --with-cscope --with-lua --HEAD
    brew install the_silver_searcher
