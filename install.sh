#!/bin/sh

mkdir -p ~/.config

ln -sT $PWD/i3 ~/.i3 && echo "i3 ok"

ln -s $PWD/vimrc ~/.vimrc && echo "vimrc ok"
ln -sT $PWD/config/nvim ~/.config/nvim && echo "config/nvim ok"
ln -sT $PWD/config/rofi ~/.config/rofi && echo "config/rofi ok"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    echo "vim-plug ok"

ln -s $PWD/clang-format ~/.clang-format && echo "clang-format ok"
