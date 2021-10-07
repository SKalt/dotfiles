#!/bin/bash
# shellcheck disable=SC1091
test -f "$HOME/.gvm/scripts/gvm" && source "$HOME/.gvm/scripts/gvm"
#    ^-- check gvm is a file (doesn't need to be executable)
