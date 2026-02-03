# Vars
EDITOR="nvim"
VISUAL="nvim"
TERMINAL="foot"

# Multi-Color
color_prompt=yes
force_color_prompt=yes

# Funny Arrow Prompt
PS1=$'\uf0a9 '
PS1="\[\e]0;\w\a\]$PS1"

# Aliases
alias o='xdg-open .'
alias grep='grep --color=auto'
alias cat='less'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Eza Check
if command -v eza &>/dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --
git'
  alias lta='lt -a'
fi

# Zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
  alias cd="zd"
  zd() {
    if [ $# -eq 0 ]; then
      builtin cd ~ && return
    elif [ -d "$1" ]; then
      builtin cd "$1"
    else
      z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
    fi
  }
fi

# Fuzzy Finder
if command -v fzf &>/dev/null; then
  export FZF_DEFAULT_OPTS="
  --layout=reverse
  --info=inline
  --height=80%
  --preview 'bat --style=numbers --color=always {} 2> /dev/null || cat {}'
  --preview-window=:hidden
  --bind='?:toggle-preview,ctrl-u:preview-page-up,ctrl-d:preview-page-down'
  --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
  --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
  --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
  if command -v rg &>/dev/null; then
    export FZF_CTRL_T_OPTS="
    --preview 'bat --style=numbers --color=always {} 2> /dev/null || cat {}'"
  fi
  alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
fi
