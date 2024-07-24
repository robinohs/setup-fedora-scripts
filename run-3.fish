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
fish_add_path /home/robin/.cargo/bin
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

# install obsidian
set OBSIDIAN_VERSION 1.6.5
sudo rm -f /tmp/Obsidian-$OBSIDIAN_VERSION.AppImage
wget -P /tmp https://github.com/obsidianmd/obsidian-releases/releases/download/v$OBSIDIAN_VERSION/Obsidian-$OBSIDIAN_VERSION.AppImage
sudo chmod +x /tmp/Obsidian-$OBSIDIAN_VERSION.AppImage
sudo mkdir -p /usr/bin/obsidian
sudo wget -P /usr/bin/obsidian https://obsidian.md/images/obsidian-logo-gradient.svg
sudo mv /tmp/Obsidian-$OBSIDIAN_VERSION.AppImage /usr/bin/obsidian/obsidian
echo "[Desktop Entry]
Name=Obsidian
Comment=A powerful knowledge base that works on top of a local folder of plain text Markdown files
Exec=/usr/bin/obsidian/obsidian
Icon=/usr/bin/obsidian/obsidian-logo-gradient.svg
Terminal=false
Type=Application
Version=$OBSIDIAN_VERSION
Categories=Office;Utility;
MimeType=x-scheme-handler/obsidian;text/html;
" >/home/robin/.local/share/applications/obsidian.desktop
fish_add_path /usr/bin/obsidian

# install syncthing
sudo dnf -y install syncthing
systemctl --user enable --now syncthing.service

# install xclip
sudo dnf -y install xclip

# install eza
sudo dnf -y install eza

# copy fish config
cp config.fish /home/robin/.config/fish/config.fish

# install flathub/flatpak
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install spotify
flatpak install flathub com.spotify.Client

# install telegram
flatpak install flathub org.telegram.desktop
