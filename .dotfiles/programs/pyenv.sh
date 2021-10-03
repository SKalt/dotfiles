#!/usr/bin/env bash
# shellcheck disable=SC2076
PYENV_ROOT="$HOME/.pyenv"

if [ -d "$PYENV_ROOT" ]; then

  export PYENV_ROOT
  if ! [[ "$PATH" =~ "$PYENV_ROOT/bin" ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
  fi
  if ! [[ "$PATH" =~ "$PYENV_ROOT/shims" ]]; then
    export PATH="$PYENV_ROOT/shims:$PATH"
  fi
  # initialize pyenv for the current shell
  eval "$(pyenv init -)" &>/dev/null
fi
