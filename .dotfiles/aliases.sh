#!/bin/bash
# shellcheck disable=SC2139
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias ,wd='cd "$(git worktree-dir)"'
if command -v bat >/dev/null; then alias cat=bat; fi
# shellcheck disable=SC2142,2154
alias ,w='w="$( ~/bin/git-pick-worktree ~/work )"; cd "${w:-.}"; unset w'
# shellcheck disable=SC2142,2154
alias ,p='p=$( ~/bin/git-pick-worktree ~/programming ); cd "${p:-.}"; unset p'
# shellcheck disable=SC2142,2154
alias tt='tt=; tt=$(~/bin/tt) && cd "${tt:-.}"; unset tt'
