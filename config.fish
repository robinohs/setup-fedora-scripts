if status is-interactive
    # Commands to run in interactive sessions can go here
end
nvm install lts
nvm use lts
zoxide init fish | source
pyenv init - | source
starship init fish | source
clear

alias cd="z"
alias cdi="zi"
alias cat="bat"
alias c="xclip -selection clipboard"
alias ssh-key="bat ~/.ssh/id_ed25519.pub "
alias ls="eza -a --grid"
alias ll="eza -a --long --tree --git --level 1"
alias lt="eza -a --long --tree --git --level 2"
