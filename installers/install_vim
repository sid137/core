#!/bin/bash

hg clone https://vim.googlecode.com/hg/ vim
cd vim

./configure --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-perlinterp --enable-cscope --enable-multibyte  --with-features=huge --enable-fontset --enable-xim --with-x --prefix=$HOME/vim
make; make install

