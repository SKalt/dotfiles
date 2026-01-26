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
    # attempt to detect the current shell
    _shell="${SHELL##/*}"
    if [ -n "${BASH_VERSION:-}" ]; then
      _shell="bash"
    elif [ -n "${ZSH_VERSION:-}" ]; then
      _shell="zsh"
    else
      _shell="${SHELL##*/}"
    fi

    if [ "$(uname -s | tr '[:upper:]' '[:lower:]')" = "darwin" ] && [ "$(uname -m)" = arm64 ]; then
        . "$HOME/.dotfiles/programs/brew.sh"
    fi
    if command -v fortune >/dev/null; then
        echo "fortune: -----------------------------------------------------------"
        fortune | sed 's/^/    /g'
        echo "--------------------------------------------------------------------"
    fi
    # modify $PATH to make programs & configuration variables available:
    . ~/.dotfiles/programs/mise.sh
    . ~/.dotfiles/programs/yarn.sh
    . ~/.dotfiles/programs/conda.sh
    . ~/.dotfiles/programs/go.sh
    . ~/.dotfiles/programs/cargo.sh
    . ~/.dotfiles/programs/flyctl.sh
    . ~/.dotfiles/programs/deno.sh
    . ~/.dotfiles/programs/docker.sh
    . ~/.dotfiles/programs/cs.sh
    . ~/.dotfiles/programs/editor.sh
    . ~/.dotfiles/programs/pnpm.sh

    # set PATH so it includes user's private bin(s) if they exist
    # $PATH doesn't care if a directory exists or not, but keep the path minimal for debugging
    if [ -d "/nix/var/nix/profiles/default/bin/" ]; then
        PATH="/nix/var/nix/profiles/default/bin/:$PATH";
    fi
    if [ -e "$HOME/.local/bin/env" ]; then . "$HOME/.local/bin/env"; fi
    if [ -d "$HOME/bin" ]; then PATH="$HOME/bin:$PATH"; fi
    if [ -d "$HOME/.local/bin" ]; then PATH="$HOME/.local/bin:$PATH"; fi
    if [ -e "$HOME/.cargo/env" ]; then . "$HOME/.cargo/env"; fi
    if [ -d "$HOME/.til/bin" ]; then PATH="$PATH:$HOME/.til/bin"; fi
    # ^ see https://github.com/skalt/til/
    if [ -d "$HOME/work/.brag/bin" ]; then
        PATH="$PATH:$HOME/work/.brag/bin"
    fi
    export PG_COLOR=auto # see https://www.postgresql.org/docs/current/color-when.html
    PROFILE_HAS_BEEN_SOURCED=true
    PROFILE_HAS_BEEN_SOURCED="$(date '+%Y-%m-%dT%H:%M:%S%z')"
    export PROFILE_HAS_BEEN_SOURCED
fi
