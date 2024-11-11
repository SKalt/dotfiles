#!/usr/bin/env bash
# specifically for https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles
# shellcheck disable=SC2296
set -eux

# assuming the current working directory is the dotfiles repo...
for f in $(git ls-files); do
  if [ -f "$HOME/$f" ]; then
    echo "[INFO] File already exists: $HOME/$f"
    mv "$HOME/$f" "$HOME/$f.bak"
  fi
done
rm -rf "$HOME/.dotfiles.git"
cp -r .git "$HOME/.dotfiles.git"

dotfiles() { git --git-dir="$HOME/.dotfiles.git/" --work-tree="$HOME" "$@"; }
dotfiles config core.excludesFile "$HOME/.dotfiles/dotfiles_exclude"
dotfiles checkout
dotfiles reset --hard

if command -v zsh >/dev/null; then
  sudo chsh "$(id -un)" --shell "$(command -v zsh)"
  #    ^^^^ can be substituted for `usermod`
fi
