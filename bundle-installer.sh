#!/bin/bash

echo "Creating vimrc link"
ln -s $(pwd)/vimrc ~/.vimrc

echo "Placing the cheatsheet in help dir"
DOC_DIR="~/.vim/doc/"
mkdir -p $DOC_DIR
ln -s $(pwd)/cheatsheet.txt $DOC_DIR

echo "Installing and placing pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

mkdir -p ~/.vim/bundle
pushd ~/.vim/bundle

echo "Downloading bundles..."
mkdir -p ~/.vim/autoload ~/.vim/bundle

git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/vim-scripts/php.vim
git clone https://github.com/joonty/vim-phpqa
git clone https://github.com/vim-scripts/taglist.vim
git clone https://github.com/myhere/vim-nodejs-complete.git
git clone https://github.com/wookiehangover/jshint.vim.git
git clone https://github.com/vim-scripts/Pydiction.git # Autosuggest for python based on a dict
git clone https://github.com/davidhalter/jedi-vim.git #Refactoring, contextual autocomplete, goto
git clone https://github.com/scrooloose/syntastic.git # Linting
git clone https://github.com/hynek/vim-python-pep8-indent.git
git clone https://github.com/mikewest/vimroom.git #Distraction Free editing mode

#git clone https://github.com/myusuf3/numbers.vim.git Interferes with vimroom by auto enabling the line-numbers
#git clone https://github.com/klen/python-mode.git Linting seems to slow down
# The installation of the solar theme requires the installation of a theme for
# the terminal itself which can be done from the repo
# https://github.com/sigurdga/gnome-terminal-colors-solarized
#git clone https://github.com/altercation/vim-colors-solarized.git

popd
