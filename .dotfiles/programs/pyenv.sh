#!/usr/bin/env bash
PYENV_ROOT="$HOME/.pyenv"

if [ -d "$PYENV_ROOT" ]; then
  export PYENV_ROOT
  # shellcheck disable=SC2076
  if ! [[ "$PATH" =~ "$PYENV_ROOT" ]]; then
    eval "$(pyenv init --path)" # sets the path
  fi
  eval "$(pyenv init -)" &>/dev/null
fi
