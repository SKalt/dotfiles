# zmodload zsh/zprof
if [ -z "${PROFILE_HAS_BEEN_SOURCED:-}" ]; then
    source ~/.zprofile
fi

# theming: use oh-my-zsh
# TODO: consider swapping to a smaller+faster framework
source ~/.dotfiles/programs/omz.sh
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/functions.sh
source ~/.dotfiles/programs/atuin.sh # gets clobbered if sourced before omz

# zprof >/tmp/zprof
# direnv hooked by OMZ plugin -- `direnv hook zsh` omitted here.
