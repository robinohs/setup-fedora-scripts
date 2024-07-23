if status is-interactive
    # Commands to run in interactive sessions can go here
end
nvm install lts
nvm use lts
zoxide init fish | source
starship init fish | source
clear

alias cd="z"
alias ssh-key="bat ~/.ssh/id_ed25519.pub"

