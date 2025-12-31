#!/bin/bash
is_installed() { command -v "$1" &>/dev/null; };
# in order of preference
editors=(
  zed
  hx
  nvim
  emacs
  vim
  vi
  code
  nano
  ed
)

challenge_file="${TEMP:-/tmp}/editor-challenge"
if [ -f "$challenge_file" ]; then
  editors="$(echo "$editors" | sort -R)"
fi

EDITOR="${EDITOR:-}"
if [ -z "$EDITOR" ]; then
  for i in "${editors[@]}"; do
    if EDITOR=$(command -v "$i") && test -x "$EDITOR"; then
      case "$EDITOR" in
        code*) EDITOR="$EDITOR --wait";;
        zed*)  EDITOR="$EDITOR -nw";;
      esac
      break
    fi
  done
fi
if [ -f "$challenge_file" ]; then
  echo "EDITOR=$EDITOR"
fi
unset challenge_file
export EDITOR
