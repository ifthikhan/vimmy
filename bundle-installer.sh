#!/bin/bash

# Bootstrapping vim set-up.

echo "Creating vimrc link"
ln -s $(pwd)/vimrc ~/.vimrc

echo "Placing the cheatsheet in help dir"
DOC_DIR=""
mkdir -p ~/.vim/doc/
ln -s $(pwd)/cheatsheet.txt ~/.vim/doc

echo "Creating host specific vimrc .vimrc"
echo '"Place settings specific to this host here' > ~/.vimrcx

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
git clone https://github.com/vim-scripts/taglist.vim
git clone https://github.com/davidhalter/jedi-vim.git
# Make sure to update the jedi code, https://github.com/davidhalter/jedi-vim/issues/53
pushd jedi-vim
git submodule update --init
popd
git clone https://github.com/scrooloose/syntastic.git # Linting
git clone https://github.com/hynek/vim-python-pep8-indent.git
git clone https://github.com/mikewest/vimroom.git #Distraction Free editing mode
git clone https://github.com/itchyny/lightline.vim # Status line modifier
git clone https://github.com/ifthikhan/vimscratch # Simple scratch buffer
git clone https://github.com/msanders/snipmate.vim
git clone https://github.com/ervandew/supertab.git

# Colorschemes
git clone https://github.com/vim-scripts/peaksea.git
git clone https://github.com/therubymug/vim-pyte.git
git clone https://github.com/wesgibbs/vim-irblack.git
git clone https://github.com/vim-scripts/mayansmoke.git

# The installation of the solar theme requires the installation of a theme for
# the terminal itself which can be done from the repo
# https://github.com/sigurdga/gnome-terminal-colors-solarized
#git clone https://github.com/altercation/vim-colors-solarized.git

popd
