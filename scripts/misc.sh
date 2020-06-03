#!/bin/sh

# Set up Dotfiles
cd ~
git init
git remote add origin https://github.com/ChandlerSwift/dotfiles.git
git fetch
git checkout -f arch
git submodule update --init --recursive  # Vundle

# Set zsh to default shell
sudo chsh -s /usr/bin/zsh chandler

# Install Vim packages
vim +PluginInstall +qall

# Remove password
sudo passwd -d chandler

# Enable systemd time syncing
sudo systemctl enable systemd-timesyncd.service
sudo systemctl start systemd-timesyncd.service

# Set up Docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker chandler
