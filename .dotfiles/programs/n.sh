#!/usr/bin/env bash
if test -d "$HOME/.n/bin"; then
    export N_PREFIX="$HOME/.n"
    export PATH="$HOME/.n/bin:$PATH"
fi
