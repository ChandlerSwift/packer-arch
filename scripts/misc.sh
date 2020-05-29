#!/bin/bash

# Set up Dotfiles
cd ~
git init
git remote add origin https://github.com/ChandlerSwift/dotfiles.git
git fetch
git checkout -f master
git submodule update --init --recursive  # Vundle

# Install Vim packages
vim -c "VundleInstall" -c "qa"

# Remove password
sudo passwd -d chandler
