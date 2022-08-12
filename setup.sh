#!/bin/dash

#--------------------------------------------------------------------#
#                          Setup variables                           #
#--------------------------------------------------------------------#

DOTS=dots
CONFIG=config
KEYBOARDS=keyboards

print_usage() {
    echo "Usage: $0 [COMMAND] [SUBCOMMANDS]"
    echo "Commands:"
    echo "   all:       setup everything"
    echo "   dots:      link dot-files"
    echo "   config:    link .config files"
    echo "   vim:       setup vim"
    echo "   lvim:      setup lunarvim"
    echo "   omz:       setup oh-my-zsh"
    echo "   qmk:       setup qmk keyboards"
    echo "   clean:     undo install"
    echo "   help:      display this message and exit"
}

[ $# -lt 1 ] && print_usage && exit 1

[ $1 = "clean" ] && BACKUP=$(mktemp -d)

#--------------------------------------------------------------------#
#                          Pretty-printing                           #
#--------------------------------------------------------------------#

# Reset
COLOR_OFF='\033[0m'

# Regular Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

OK="${GREEN}OK${COLOR_OFF}"
KO="${RED}KO${COLOR_OFF}"

print_category() {
    echo "${CYAN}>> $1${COLOR_OFF}"
}

print_unimplemented() {
    echo "${YELLOW}TBD${COLOR_OFF}"
}

#--------------------------------------------------------------------#
#                             Dot files                              #
#--------------------------------------------------------------------#

link_dots() {
    print_category "DOT FILES"

    DIR="$PWD/$1"
    SUCCESS=true

    for file in $(ls "$DIR"); do
        SRC="$DIR/$file"
        DST="$HOME/.$file"

        if [ -e "$DST" ]; then
            echo "$KO $DST already exists, could not symlink"
            SUCCESS=false
        else
            printf "$OK Linking $file... "
            ln -sT "$SRC" "$DST" && echo "done"
        fi
    done

    if ! $SUCCESS; then
        echo "Some links where not processed. Use \`$0 clean\` to remove then."
    fi
}

clean_dots() {
    print_category "DOT FILES"

    DIR="$PWD/$1"

    for file in $(ls "$DIR"); do
        DST="$HOME/.$file"

        if [ -e "$DST" ]; then
            mv "$DST" "$BACKUP"
        fi
    done
}

#--------------------------------------------------------------------#
#                               Config                               #
#--------------------------------------------------------------------#

link_config() {
    print_category "CONFIG FILES"

    DIR="$PWD/$1"
    SUCCESS=true

    for file in $(ls "$DIR"); do
        SRC="$DIR/$file"
        DST="$HOME/.config/$file"

        if [ -e "$DST" ]; then
            echo "$KO $DST already exists, could not symlink"
            SUCCESS=false
        else
            printf "$OK Linking $file... "
            ln -sT "$SRC" "$DST" && echo "done"
        fi
    done

    if ! $SUCCESS; then
        echo "Some links where not processed. Use \`$0 clean\` to remove then."
    fi
}

clean_config() {
    print_category "CONFIG"

    DIR="$PWD/$1"

    for file in $(ls "$DIR"); do
        DST="$HOME/.config/$file"

        if [ -e "$DST" ]; then
            mv "$DST" "$BACKUP"
        fi
    done
}

#--------------------------------------------------------------------#
#                            Vim/LunarVim                            #
#--------------------------------------------------------------------#

setup_vim() {
    print_category "VIM"

    echo -n "downloading vim-plug... "
    curl -fLso ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
        echo "$OK" || echo "$KO"
}

setup_lvim() {
    print_category "LVIM"

    sh -c "bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)"
}

#--------------------------------------------------------------------#
#                             Oh my zsh                              #
#--------------------------------------------------------------------#

setup_omz() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM"/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM"/zsh-syntax-highlighting
    git clone https://github.com/softmoth/zsh-vim-mode.git "$ZSH_CUSTOM"/zsh-vim-mode
    git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"
}

#--------------------------------------------------------------------#
#                                QMK                                 #
#--------------------------------------------------------------------#

qmk_usage() {
    echo "QMK subcommands:"
    echo "   init:       initialize qmk local repository"
    echo "   gergoplex:  build and flash gergoplex"
    echo "   help:       display this message"
}

qmk() {
    QMK="$KEYBOARDS/qmk"
    if [ $# -eq 0 ]; then
        qmk_usage
    else
        for arg; do
            case $arg in
            init)
                git submodule init $QMK
                git submodule update $QMK
                ln -sT "$PWD/$KEYBOARDS/gergoplex" \
                    "$QMK/keyboards/gboards/k/gergoplex/keymaps/mael"
                make -C $QMK git-submodule
                ;;
            gergoplex)
                CFLAGS="" make -C $QMK "gboards/k/gergoplex:mael:dfu"
                ;;
            help)
                qmk_usage
                ;;
            *)
                echo "unrecognized qmk subcommand $arg"
                qmk_usage
                exit 1
                ;;
            esac
        done
    fi
}

#--------------------------------------------------------------------#
#                                Main                                #
#--------------------------------------------------------------------#

setup_all() {
    link_dots $DOTS
    link_config $CONFIG
    setup_vim
    setup_lvim
    setup_omz
}

clean_all() {
    clean_dots $DOTS
    clean_config $CONFIG
}

clean() {
    if [ $# -eq 0 ]; then
        clean_all
    else
        for arg; do
            case $arg in
            dots)
                clean_dots $DOTS
                ;;
            config)
                clean_config $CONFIG
                ;;
            *)
                echo "unrecognized clean subcommand $arg"
                exit 1
                ;;
            esac
        done
    fi
}

MODE="$1"
shift

case $MODE in
all)
    setup_all
    ;;
dots)
    link_dots $DOTS
    ;;
config)
    link_config $CONFIG
    ;;
vim)
    setup_vim
    ;;
lvim)
    setup_lvim
    ;;
omz)
    setup_omz
    ;;
qmk)
    qmk $@
    ;;
clean)
    clean $@
    echo "Cleaned files backuped to $BACKUP"
    ;;
help)
    print_usage
    ;;
*)
    echo "unrecognized command $MODE"
    print_usage
    exit 1
    ;;
esac
