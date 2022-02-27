#!/bin/dash

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

print_usage() {
    echo "Usage: $0 [COMMAND] [SUBCOMMANDS]"
    echo "Commands:"
    echo "   all:       setup everything"
    echo "   dots:      link dot-files"
    echo "   config:    link .config files"
    echo "   clean:     undo install"
    echo "   help:      display this message and exit"
    echo "Default is 'all'."

}

#--------------------------------------------------------------------#
#                          Setup variables                           #
#--------------------------------------------------------------------#

DOTS=dots
CONFIG=config

[ $1 = "clean" ] && BACKUP=$(mktemp -d)

#--------------------------------------------------------------------#
#                             Installer                              #
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
            ln -s "$SRC" "$DST" && echo "done"
        fi
    done

    if ! $SUCCESS; then
        echo "Some links where not processed. Use \`$0 clean\` to remove then."
    fi
}

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

setup_all() {
    link_dots $DOTS
    link_config $CONFIG
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
                echo "unrecognized clean option $arg"
                exit 1
                ;;
            esac
        done
    fi
}

#--------------------------------------------------------------------#
#                                Main                                #
#--------------------------------------------------------------------#

MODE=${1:-all} # Mode is the first argument or "all" if no arg is given

[ $# -ge 1 ] && shift

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
    ;;
esac
