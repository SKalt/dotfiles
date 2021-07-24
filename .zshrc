if [ -z "${PROFILE_HAS_BEEN_SOURCED:-}" ]; then
    source ~/.zprofile
fi

# theming: use oh-my-zsh
source ~/.dotfiles/programs/omz.sh
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/functions.sh
eval $(thefuck --alias)
