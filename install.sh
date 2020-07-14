#!/bin/sh

ln -s clang-format ~/.clang-format
ln -s vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s config/nvim/init.vim ~/.config/nvim/init.vim
ln -s config/nvim/plugins ~/.config/nvim/plugins

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
