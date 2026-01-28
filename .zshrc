zmodload zsh/zprof
if [ -z "${PROFILE_HAS_BEEN_SOURCED:-}" ]; then
    source ~/.zprofile
fi

# theming: use oh-my-zsh
# TODO: consider swapping to a smaller+faster framework
# source ~/.dotfiles/programs/omz.sh
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/functions.sh
source ~/.dotfiles/programs/atuin.sh # gets clobbered if sourced before omz

# Reload completions after direnv updates $FPATH or $XDG_DATA_DIRS
# See https://github.com/BronzeDeer/zsh-completion-sync
# See https://github.com/direnv/direnv/issues/443
f="$HOME/programming/forks/zsh-completion-sync/zsh-completion-sync.plugin.zsh"
# zstyle ':completion-sync:*' debug true
if [ -f "$f" ]; then
  source "$f";
fi
unset f
# zprof >/tmp/zprof

# direnv hooked by OMZ plugin -- `direnv hook zsh` omitted here.

if [ -f "$HOME/.local/bin/env" ]; then . "$HOME/.local/bin/env"; fi

if command -v mise >/dev/null; then
  eval "$(mise activate zsh --shims)"
  eval "$(mise activate zsh)"
fi
_shell=zsh . ~/.dotfiles/programs/atuin.sh

autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
autoload bashcompinit
bashcompinit
zprof


# User configuration
if (command -v starship &>/dev/null); then
    eval "$(starship init zsh)" # theme the prompt using starship
else
    export PS1='$(if [ $? = 0 ];then tput setaf 2;else tput setaf 1;fi); $(tput sgr0)'
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
