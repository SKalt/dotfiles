#!/bin/bash
# shellcheck disable=SC2139
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias ,wd='cd "$(git worktree-dir)"'
if command -v bat >/dev/null; then alias cat=bat; fi
alias ggit='git'
alias ,gg='cd "$(git rev-parse --show-toplevel)"'
# shellcheck disable=SC1091
if [ -f "$HOME/work/.aliases.sh" ]; then . "$HOME/work/.aliases.sh"; fi
