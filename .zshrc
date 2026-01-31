# zmodload zsh/zprof
if [ -z "${PROFILE_HAS_BEEN_SOURCED:-}" ]; then
    source ~/.zprofile
fi

# theming: use oh-my-zsh
# TODO: consider swapping to a smaller+faster framework
# source ~/.dotfiles/programs/omz.sh
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/functions.sh
source ~/.dotfiles/programs/atuin.sh # gets clobbered if sourced before omz

# Add completions installed through Homebrew packages
# See: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

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
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
autoload bashcompinit
bashcompinit

setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt prompt_subst
# User configuration
if (command -v starship &>/dev/null); then
    eval "$(starship init zsh)" # theme the prompt using starship
else
     export PS1='$(if [ $? = 0 ];then tput setaf 2;else tput setaf 1;fi); $(tput sgr0)'
fi

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Vim Keybindings
bindkey -v

# This is a "fix" for zsh in Ghostty:
# Ghostty implements the fixterms specification https://www.leonerd.org.uk/hacks/fixterms/
# and under that `Ctrl-[` doesn't send escape but `ESC [91;5u`.
#
# (tmux and Neovim both handle 91;5u correctly, but raw zsh inside Ghostty doesn't)
#
# Thanks to @rockorager for this!
bindkey "^[[91;5u" vi-cmd-mode
# zprof
