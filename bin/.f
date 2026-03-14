#!/bin/bash
if [ "$#" -eq 0 ]; then
    GIT_DIR="$HOME/.dotfiles.git" GIT_WORK_TREE="$HOME" e ~/.profile  ~/.bashrc ~/.zprofile ~/.zshrc ~/.dotfiles/ ~/bin/;
else
    git --work-tree="$HOME" --git-dir="$HOME/.dotfiles.git" "$@"
fi
