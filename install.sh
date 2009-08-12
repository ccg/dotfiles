#!/bin/sh

for i in .*
do
    src=$PWD/$i
    dst=$HOME/$i
    if [ -f $i ]
    then
        if [ -f $HOME/$i ]
        then
            echo "Skipping file '$dst'"
        else
            echo "Linking '$src' to '$dst'"
            ln -s "$src" "$dst"
        fi
    fi
done

