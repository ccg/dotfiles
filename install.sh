#!/bin/sh

linkfile() {
    src="$1"
    dst="$2"
    if [ ! -f "$src" ]; then
        #echo "Skipping '$dst' because it's not a regular file."
        return
    fi
    if [ -f "$dst" ]; then
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
    linkfile "$PWD/$i" "$HOME/$i"
done

# dot directories
#[ -d .vim ] && ln -s .vim $HOME/.vim

# helper scripts
for i in fixssh grabssh
do
    [ ! -d "$HOME/bin" ] && mkdir "$HOME/bin"
    linkfile "$PWD/$i" "$HOME/bin/$i"
done
