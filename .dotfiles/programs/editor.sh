#!/usr/bin/env bash
is_installed() { command -v "$1" &>/dev/null; };
if   is_installed hx;   then EDITOR='hx';
elif is_installed code; then EDITOR='code --wait';
elif is_installed nvim; then EDITOR='nvim'
elif is_installed vim;  then EDITOR='vim'
elif is_installed vi;   then EDITOR='vi';
elif is_installed nano; then EDITOR='nano';
else EDITOR='ed'; # <- part of posix
fi;
export EDITOR;