#!/bin/sh

mkdir -p ~/.config

dots="zshrc vimrc i3blocks.conf i3status.conf clang-format"
configs="nvim rofi i3"

# Home dot files
for elt in $dots; do
    echo -n "$elt... " && ln -s $PWD/$elt ~/.$elt && echo "OK";
done

# Config folders
for elt in $configs; do
    echo -n "$elt... " && ln -sT $PWD/$elt ~/.config/$elt && echo "OK";
done

# i3 install
# echo -n "i3... " && ln -sT $PWD/i3 ~/.i3 && echo "OK";

# vim-plug
echo -n "vim-plug... " && curl -fLso ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    echo "OK" || echo "KO"

echo -n "oh my zsh... " && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo "OK"
