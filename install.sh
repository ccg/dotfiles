#!/bin/sh

link() {
    src="$1"
    dst="$2"
    if [ ! -e "$src" ]; then
        echo "ERROR: source object '$src' doesn't exist."
        return
    fi
    if [ -e "$dst" ]; then
        if [ ! -L "$dst" ]; then
            echo "WARNING: '$dst' already exists and is NOT a symlink!"
        else
            #echo "Skipping file '$dst'"
            return
        fi
    else
        echo "Linking '$src' to '$dst'"
        ln -s "$src" "$dst"
    fi
}

# dot files (not directories)
for i in .*
do
    if [ ! -d "$i" ]
    then
        link "$PWD/$i" "$HOME/$i"
    fi
done

# dot directories
# by inclusion, so things like '..' and '.git' don't get in there accidentally
for i in .vim
do
    [ -d "$i" ] && link "$PWD/$i" "$HOME/$i"
done

# helper scripts
for i in fixssh grabssh
do
    [ ! -d "$HOME/bin" ] && mkdir "$HOME/bin"
    link "$PWD/$i" "$HOME/bin/$i"
done
