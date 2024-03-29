#!/bin/sh

mkdir -p ~/.config

dots="\
    Xresources\
    profile\
    zshrc\
    vimrc\
    clang-format\
    ocamlinit\
    ocamlformat\
    gitignore\
    gitconfig\
    "

configs="\
    nvim\
    lvim\
    kitty\
    "

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

# custom oh my zsh plugins
ZSH_CUSTOM=~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM"/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM"/zsh-syntax-highlighting
git clone https://github.com/softmoth/zsh-vim-mode.git "$ZSH_CUSTOM"/zsh-vim-mode
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"

# Konsole profiles and colorschemes
# KONSOLE_CONFIG_DIR="konsole-config"
# KONSOLE_LOCAL_DIR="$HOME/.local/share/konsole"
# mkdir -p $KONSOLE_LOCAL_DIR
# 
# KONSOLE_NB_THEMES="$(ls $KONSOLE_CONFIG_DIR | wc -l)"
# i=1
# echo "Konsole config..."
# for elt in $(ls $KONSOLE_CONFIG_DIR); do
#     echo -n "    $i/$KONSOLE_NB_THEMES - $elt... " && ln -s $PWD/$KONSOLE_CONFIG_DIR/$elt $KONSOLE_LOCAL_DIR/$elt && echo "OK"
# done
# echo "Konsole config done"
