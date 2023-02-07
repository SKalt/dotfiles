#!/bin/sh

# ~/.profile: executed by the command interpreter for login shells.
# I've also set ~/.bash_profile and ~/.zprofile to source this one for
# consistency.
# For more information on when .*profile and .*rc files run, see
# https://unix.stackexchange.com/a/579832/234355

# shellcheck disable=SC1090,SC1091
# ^ don't warn about non-constant or external sources

. ~/.dotfiles/programs/fuck.sh # <- defines a function
if [ -z "${PROFILE_HAS_BEEN_SOURCED:-}" ]; then
    if [ "$(uname -s | tr '[:upper:]' '[:lower:]')" = "darwin" ] && [ "$(uname -m)" = arm64 ]; then
        . "$HOME/.dotfiles/programs/brew.sh"
    fi
    if command -v fortune >/dev/null; then
        echo "fortune: -----------------------------------------------------------"
        fortune | sed 's/^/    /g'
        echo "--------------------------------------------------------------------"
    fi
    # modify $PATH to make programs & configuration variables available:
    . ~/.dotfiles/programs/yarn.sh
    . ~/.dotfiles/programs/conda.sh
    . ~/.dotfiles/programs/go.sh
    . ~/.dotfiles/programs/gvm.sh
    . ~/.dotfiles/programs/cargo.sh
    . ~/.dotfiles/programs/flyctl.sh
    . ~/.dotfiles/programs/pyenv.sh
    . ~/.dotfiles/programs/deno.sh
    . ~/.dotfiles/programs/docker.sh
    . ~/.dotfiles/programs/cs.sh
    . ~/.dotfiles/programs/n.sh
    . ~/.dotfiles/programs/editor.sh
    . ~/.dotfiles/programs/pnpm.sh

    # set PATH so it includes user's private bin(s) if they exist
    if [ -d "$HOME/bin" ]; then PATH="$HOME/bin:$PATH"; fi
    if [ -d "$HOME/.local/bin" ]; then PATH="$HOME/.local/bin:$PATH"; fi
    if [ -e "$HOME/.cargo/env" ]; then . "$HOME/.cargo/env"; fi
    if [ -d "$HOME/.til/bin" ]; then PATH="$PATH:$HOME/.til/bin"; fi
    # ^ see https://github.com/skalt/til/
    if [ -d "$HOME/work/.brag/bin" ]; then
        PATH="$PATH:$HOME/work/.brag/bin"
    fi
fi

export PROFILE_HAS_BEEN_SOURCED=true
