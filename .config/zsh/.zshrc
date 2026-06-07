# Vars
EDITOR="hx"
VISUAL="hx"
TERMINAL="ghostty"
NIX_LOG="info"
NIX_PATH="nixpkgs=channel:nixos-unstable"

HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

alias ll='ls -l'
alias la='ls -laF'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cat='bat'

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

autoload -Uz compinit
compinit

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

function _load_ssh_agent() {
    if [ -z "$$SSH_AUTH_SOCK" ]; then
        eval "$(ssh-agent -s)" > /dev/null
        ssh-add ~/.ssh/nosk-BarryLabs 2>/dev/null
    fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd _load_ssh_agent

# Stuff
eval "$(devenv hook zsh)"
eval "$(starship init zsh)"
