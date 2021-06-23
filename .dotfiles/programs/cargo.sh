#!/bin/bash
# set the path to include binaries installed with `cargo`
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"
