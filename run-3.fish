#!/usr/bin/env fish

# setup folders
mkdir ~/repos
mkdir ~/papers

# install required tools
sudo dnf groupinstall 'Development Tools' -y

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
nvm install lts
nvm use lts
node -v

# install rust
sudo dnf install rustup -y
rustup-init
fish_add_path ~/.cargo/bin
cargo install cargo-binstall

# install starship
curl -sS https://starship.rs/install.sh | sh

# install thunderbird
sudo dnf install thunderbird -y

# install VSCODE
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
sudo dnf check-update
sudo dnf install code -y

# install warp
sudo rpm --import https://releases.warp.dev/linux/keys/warp.asc
sudo sh -c 'echo -e "[warpdotdev]\nname=warpdotdev\nbaseurl=https://releases.warp.dev/linux/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://releases.warp.dev/linux/keys/warp.asc" > /etc/yum.repos.d/warpdotdev.repo'
sudo dnf install warp-terminal -y

# install bat
sudo dnf install bat -y

# install du-dust
cargo binstall du-dust

# install zoxide
sudo dnf install zoxide -y

# install docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker

# install podman
sudo dnf -y install podman

# install gitlab-ci-local
npm install -g gitlab-ci-local

# install act
sudo dnf -y copr enable goncalossilva/act
sudo dnf -y install act-cli
sudo docker pull catthehacker/ubuntu:full-latest

# install syncthing
sudo dnf -y install syncthing
systemctl --user enable --now syncthing.service

# install xclip
sudo dnf -y install xclip

# install eza
sudo dnf -y install eza

# install pyenv
curl https://pyenv.run | bash
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

# install python
pyenv install 3.12
pyenv global 3.12

# install pipx
sudo dnf -y install pipx

# install poetry
pipx install poetry 
fish_add_path ~/.local/bin
poetry completions fish > ~/.config/fish/completions/poetry.fish

# install flathub/flatpak and apps
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub org.telegram.desktop
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub com.mattermost.Desktop
flatpak install -y flathub com.discordapp.Discord

# remove non-required default apps
sudo dnf remove -y kpat kmines kaddressbook kmail kontact neochat kmouth

# copy fish config
cp config.fish ~/.config/fish/config.fish
