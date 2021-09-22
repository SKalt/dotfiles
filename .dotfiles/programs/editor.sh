#!/usr/bin/env bash
EDITOR='vi'
if command -v code &>/dev/null; then EDITOR='code --wait'; fi;
export EDITOR;