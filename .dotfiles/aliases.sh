#!/bin/bash
# shellcheck disable=SC2139
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias ,wd='cd "$(git worktree-dir)"'
if command -v bat >/dev/null; then alias cat=bat; fi
