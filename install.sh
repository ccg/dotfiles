#!/bin/sh

for i in .*
do
    src="$PWD/$i"
    dst="$HOME/$i"
    if [ ! -f "$src" ]; then
        echo "Skipping '$dst'"
        continue
    fi
    if [ -f "$dst" ]; then
        if [ ! -L "$dst" ]; then
            echo "WARNING: '$dst' already exists and is NOT a symlink!"
        else
            echo "Skipping file '$dst'"
        fi
    else
        echo "Linking '$src' to '$dst'"
        ln -s "$src" "$dst"
    fi
done

