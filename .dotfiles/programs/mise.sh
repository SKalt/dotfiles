#!/bin/sh
if command -v mise >/dev/null; then
  case "${_shell:-}" in
    bash|zsh)
      eval "$(mise activate "$_shell" --shims)"
  esac
fi
