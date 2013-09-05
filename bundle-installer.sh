#!/bin/bash

echo "Creating vimrc link"
ln -s vimrc ~/.vimrc

echo "Installing and placing pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

mkdir -p ~/.vim/bundle
pushd ~/.vim/bundle

echo "Downloading bundles..."
mkdir -p ~/.vim/autoload ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/myusuf3/numbers.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/klen/python-mode.git
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/vim-scripts/php.vim
git clone https://github.com/joonty/vim-phpqa
git clone https://github.com/vim-scripts/taglist.vim
git clone https://github.com/myhere/vim-nodejs-complete.git
git clone https://github.com/wookiehangover/jshint.vim.git

popd
