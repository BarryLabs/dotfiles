set fish_greeting
set -gx EDITOR hx
direnv hook fish | source
devenv hook fish | source
starship init fish | source
zoxide init fish | source
# eval (ssh-agent -c)
