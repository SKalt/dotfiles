#!/bin/sh
tfenv_path=""; tfenv_path="$(command -v tfenv 2>/dev/null || true)"
if [ -n "$tfenv_path" ]; then
    tfenv_bins="$HOME/.tfenv"
    if test -L "$tfenv_path"; then # tfenv is a link, and so likely managed by `brew`
        # note that `nixpkgs` doesn't provide a `tfenv` package since `nix` can do tfenv's job
        tfenv_path="$(realpath "$tfenv_path")";
        tfenv_bins="$(dirname "$tfenv_path")"
        :; # FIXME
    fi
    if ! test -d "$tfenv_bins"; then
        echo "WARNING: $tfenv_bins is not a directory"
    else
        export PATH="$tfenv_bins:$PATH"
    fi
    unset tfenv_bins
fi
unset tfenv_path;