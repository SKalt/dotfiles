#!/bin/sh
# ~/.profile: executed by the command interpreter for login shells.
# I've also set ~/.bash_profile and ~/.zprofile to source this one

# modify $PATH to make programs & configuration variables available:
. ~/.dotfiles/programs/yarn.sh
. ~/.dotfiles/programs/conda.sh;
. ~/.dotfiles/programs/go.sh;
. ~/.dotfiles/programs/gvm.sh;
. ~/.dotfiles/programs/cargo.sh;
. ~/.dotfiles/programs/flyctl.sh;
. ~/.dotfiles/programs/pyenv.sh;
. ~/.dotfiles/programs/deno.sh;
. ~/.dotfiles/programs/docker.sh;
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then PATH="$HOME/bin:$PATH"; fi
if [ -d "$HOME/.local/bin" ]; then PATH="$HOME/.local/bin:$PATH"; fi

. ~/.dotfiles/functions.sh

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash:
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
#         . "$HOME/.bashrc";
#     fi
# fi
