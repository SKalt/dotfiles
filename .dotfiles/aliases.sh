#!/bin/bash
# shellcheck disable=SC2139
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias ,wd='cd "$(git worktree-dir)"'
if command -v bat >/dev/null; then alias cat=bat; fi
# shellcheck disable=SC2142,2154
alias ,w='w="$(
  find ~/work  -type d -maxdepth 3 -name "*.git"  -exec git --git-dir={} worktree  list ";" |
    sed "s#$HOME/work/##g" |
    awk "{ print \$1 }" |
    sort -u |
    fzf |
    sed "s#^#$HOME/work/#g"
)"; cd "${w:-.}"; unset w
'
# shellcheck disable=SC2142,2154
alias ,p='p=$(
  find ~/programming ~/programming/forks  -type d -maxdepth 3 -name "*.git"  -exec git --git-dir={} worktree  list ";" |
    sed "s#$HOME/programming/##g" |
    awk "{ print \$1 }" |
    sort -u |
    fzf |
    sed "s#^#$HOME/programming/#g"
); cd "${p:-.}"; unset p
'
