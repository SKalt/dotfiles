#!/bin/sh
[ -f $HOME/.atuin/bin/env ] && . $HOME/.atuin/bin/env 
if command -v atuin > /dev/null 2>&1; then
    _shell="${SHELL##*/}"
    case "$_shell" in
        bash|zsh) ;;
        *)
            _shell="${0##-}"
            _shell="${_shell##*/}"
            ;;
    esac
    eval "$(atuin init "$_shell" --disable-up-arrow)"
    unset _shell _cmd
fi
