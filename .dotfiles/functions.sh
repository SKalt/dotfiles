#!/usr/bin/env bash

til() {
    local target
    target="$HOME/.til/$(date +'%Y/%m/%d').md"
    local target_dir="${target%/*}"
    mkdir -p "$target_dir"
    (
        cd "$target_dir" || exit 127

        # ensure the git directory is configured
        if ! (git rev-parse); then
            (
                cd "$HOME/.til" &&
                    git init &&
                    git remote add origin https://github.com/SKalt/til.git &&
                    git fetch &&
                    git checkout --track origin/master
            )
        else
            git pull
        fi

        # ensure a preformatted file is at $target
        if ! test -e "$target"; then
            {
                echo "---"
                echo "tags: []"
                echo "---"
            } >"$target"
        fi

        local before
        before="$(shasum -a 256 "$target")"
        ${EDITOR:-vi} "$target"
        local after
        after="$(shasum -a 256 "$target")"

        if [ "$before" != "$after" ]; then
            git add "$target"
            if (git status --short | grep -qe '^.M'); then
                git commit --no-gpg-sign --amend
            else
                git commit --no-gpg-sign -m "til"
            fi
            git push
        fi
    )
}
