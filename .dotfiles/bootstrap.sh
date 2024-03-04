#!/usr/bin/env bash
git clone --bare https://github.com/SKalt/dotfiles.git "$HOME/.dotfiles.git"
alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
dotfiles config core.excludesFile "$HOME/.dotfiles/dotfiles_exclude"
dotfiles checkout