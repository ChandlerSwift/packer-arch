#!/bin/sh

# potentially also include alsa-utils, iwd, qt5-wayland, pulseaudio, node
# We already have `base base-devel linux dhcpcd grub openssh sudo` from base install
sudo pacman -Sy --noconfirm \
	alacritty \
	docker \
	firefox \
	git \
	go \
	grim \
	i3status \
	imagemagick \
	ipython \
	jq \
	mako \
	man-db \
	man-pages \
	pv \
	python \
	python-pip \
	rsync \
	slurp \
	sshfs \
	sway \
	swayidle \
	swaylock \
	ttf-fira-code \
	vim \
	wofi \
	xorg-server-xwayland \
	youtube-dl \
	zsh \
	zsh-completions

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

pip install pipenv \
	youtube-dl
