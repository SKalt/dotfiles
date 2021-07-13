#!/usr/bin/env bash

til() {
    local target; target="$HOME/til/$(date +'%Y/%m/%d').md"
    local target_dir="${target%/*}";
    mkdir -p "$target_dir"
    (
        cd "$target_dir" || exit 127;
        local amend="";
        if ! test -e "$target"; then
            amend="false"
            {
                echo "---"
                echo "tags: []"
                echo "---"
            } > "$target"
        else amend="true"
        fi
        ${EDITOR:-vi} "$target"
        if ! (git rev-parse); then
            (
                cd "$HOME/til" &&
                git init &&
                git remote add origin https://github.com/SKalt/til.git &&
                git fetch &&
                git checkout --track origin/master
            );
        else
            git pull
        fi
        git add "$target"
        if [ "$amend" = "true" ]; then git commit --amend;
        else git commit -m "til";
        fi
    )
}