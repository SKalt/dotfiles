#!/bin/sh
case "${_shell:-}" in
  bash|zsh) 
    eval "$(mise activate "$_shell")"
    export DOTFILES_MISE_ACTIVATED="${_shell} / $(date)"
    ;;
esac
