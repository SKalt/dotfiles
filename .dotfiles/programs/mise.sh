#!/bin/sh
case "${_shell:-}" in
  bash|zsh) 
    echo "$_shell"
    eval "$("$HOME"/.local/bin/mise activate "$_shell")"
    echo "activated"
    ;;
esac
