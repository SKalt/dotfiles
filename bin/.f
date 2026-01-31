#!/bin/bash
export GIT_DIR="$HOME/.dotfiles.git"
if [ "$#" -eq 0 ]; then
    e ~/.profile  ~/.bashrc ~/.zprofile ~/.zshrc ~/.dotfiles/ ~/bin/;
else
    git --work-tree="$HOME" "$@"
fi
