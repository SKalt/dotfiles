if [ -z "${PROFILE_HAS_BEEN_SOURCED:-}" ]; then
    source ~/.zprofile
fi

# theming: use oh-my-zsh
# TODO: consider swapping to a smaller+faster framework
source ~/.dotfiles/programs/omz.sh
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/functions.sh
if (command -v thefuck &>/dev/null); then eval $(thefuck --alias); fi