#!/bin/bash

# potentially also include alsa-utils, iwd, qt5-wayland, pulseaudio, node
# We already have `base base-devel linux dhcpcd grub openssh sudo` from base install
# For non-virtualized installs, also include grub, alsa-utils, pulseaudio
PACKAGES=(
	alacritty
	dhcpcd
	docker
	firefox
	freerdp # RDP support in Remmina
	git
	go
	grim
	i3status
	imagemagick
	ipython
	jq
	kubectl
	mako # notifications, comparable to dunst
	man-db
	man-pages
	openconnect # VPN
	parallel
	pv
	python
	python-pip
	remmina
	rsync
	slurp
	sshfs
	strace
	sway
	swayidle
	swaylock
	ttf-fira-code
	units
	unzip
	vim
	wl-clipboard
	wofi # dmenu replacement
	xorg-server-xwayland
	youtube-dl
	yq
	zsh
	zsh-completions
)

sudo pacman -Sy --noconfirm ${PACKAGES[@]}

# install yay (https://github.com/Jguer/yay)
cd /tmp
git clone https://aur.archlinux.org/yay
cd yay
makepkg --syncdeps --install --noconfirm

export PKGEXT=.pkg.tar # don't compress aur packages before installing
yay -S --noconfirm \
	azure-cli \
	powershell-bin \
	slack-desktop \
	visual-studio-code-bin
# yay -S vscodium --noconfirm
# yay -S visual-studio-code-insiders --noconfirm
# For non-virtualized installs, also include spotify, teams

pip install pipenv \
	youtube-dl
