#!

# potentially also include alsa-utils, iwd, qt5-wayland
sudo pacman -Sy --noconfirm \
	alacritty \
	docker \
	firefox \
	git \
	go \
	grim \
	i3status \
	imagemagick \
	jq \
	man-db \
	man-pages \
	openssh \
	pv \
	python \
	slurp \
	sshfs \
	sway \
	swayidle \
	swaylock \
	vim \
	wofi \
	youtube-dl \
	zsh \
	zsh-completions

# install yay (https://github.com/Jguer/yay)
cd /tmp
git clone https://aur.archlinux.org/yay
cd yay
makepkg --syncdeps --install --noconfirm

yay -S visual-studio-code-bin --noconfirm
# yay -S vscodium --noconfirm
# yay -S visual-studio-code-insiders --noconfirm
