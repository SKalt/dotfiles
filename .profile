#!/bin/sh
# ~/.profile: executed by the command interpreter for login shells.
# I've also set ~/.bash_profile and ~/.zprofile to source this one for
# consistency.
# For more information on when .*profile and .*rc files run, see
# https://unix.stackexchange.com/a/579832/234355

if [ -z "${PROFILE_HAS_BEEN_SOURCED:-}" ]; then 
    # modify $PATH to make programs & configuration variables available:
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/yarn.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/conda.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/go.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/gvm.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/cargo.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/flyctl.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/pyenv.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/deno.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/docker.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/pyenv.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/cs.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/n.sh
    # shellcheck disable=SC1090
    . ~/.dotfiles/programs/editor.sh 

    # set PATH so it includes user's private bin(s) if it exists
    if [ -d "$HOME/bin" ];        then PATH="$HOME/bin:$PATH"        ; fi
    if [ -d "$HOME/.local/bin" ]; then PATH="$HOME/.local/bin:$PATH" ; fi
    if [ -d "$HOME/.til/bin" ];   then PATH="$PATH:$HOME/.til/bin"   ; fi
    # ^ see github.com/skalt/til
    if [ -e "$HOME/.cargo/env" ]; then
        # shellcheck disable=SC1091
        . "$HOME/.cargo/env";
    fi
fi

export PROFILE_HAS_BEEN_SOURCED=true
