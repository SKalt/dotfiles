#!/usr/bin/env bash
if command -v pyenv 1>/dev/null 2>&1; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)" &>/dev/null
fi
