#!/bin/sh
[ -f "$HOME/.atuin/bin/env" ] && . "$HOME/.atuin/bin/env"
if command -v atuin > /dev/null 2>&1; then
    case "${_shell:-}" in
      bash|zsh)
        eval "$(atuin init "$_shell" --disable-up-arrow)"
        ;;
    esac
fi
