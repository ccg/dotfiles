#!/bin/sh

# First, make sure all the submodules are checked out
# TODO: Delete this if no longer needed.
#git submodule update --init --recursive

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

SSH_DIR="$HOME/.ssh"

# required directories
mkdir -p "$SSH_DIR"
mkdir -p "$HOME/.nvm"
mkdir -p "$HOME/.vimtmp"

# dot files and directories
# by inclusion, so things like '..' and '.git' don't get in there accidentally
for i in .vim .vimrc .zshrc
do
    link "$PWD/$i" "$HOME/$i"
done

# files not at the top level
link "${PWD}/.ssh/config" "${SSH_DIR}/config"
