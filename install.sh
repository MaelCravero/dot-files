#!/bin/sh

set -e
mkdir -p ~/.config

ln -s $PWD/clang-format ~/.clang-format
ln -s $PWD/vimrc ~/.vimrc

ln -sT $PWD/config/nvim ~/.config/nvim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
