#!/bin/sh
cs_dir="$HOME/.local/share/coursier/bin"
if [ -d "$cs_dir" ]; then  export PATH="$PATH:$cs_dir"; fi
unset cs_dir;
