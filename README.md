# Dotfiles
> Welcome `$HOME`

This repo is where I collect my configuration and how I distribute it to each of my machines.
While this repo does not include any credentials or machine-specific configuration, it has places to put them.

## Setup a new machine

```sh
#!/usr/bin/env bash
git clone --bare https://github.com/SKalt/dotfiles.git $HOME/.dotfiles.git
alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
dotfiles config core.excludesFile $HOME/.dotfiles/dotfiles_exclude
dotfiles checkout
```

## Directory structure

```
$HOME
├── .dotfiles.git # where the git state lives
├── .dotfiles
|   ├── dotfiles_exclude # ignores everything
|   ├── aliases.sh       # zsh/bash aliases; sourced by ~/.profile
|   ├── functions.sh     # bash/zsh function definitions; sourced by ~/.profile
|   └── programs/*.sh    # sourced by ~/.profile
├── .profile
├── .zprofile # sources .profile
└── .zshrc    # sources .dotfiles/{function,aliase}s.sh

```



