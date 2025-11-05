#!/bin/sh
is_installed() { command -v "$1" &>/dev/null; };
# in order of preference
editors="
  hx
  zed
  nvim
  emacs
  vim
  vi
  code
  nano
  ed
"

if [ -z "$EDITOR" ]; then
    EDITOR=
    for i in $editors; do
      if EDITOR=$(command -v $i) && test -x "$EDITOR"; then
            case $EDITOR in
                code) EDITOR='code --wait';;
                zed) EDITOR='zed -nw';;
            esac
          break
        fi
    done
fi
export EDITOR
