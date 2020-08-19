#!/bin/sh

if [ "$COPY_HOMEDIR" -eq "true" ]; then
	echo "Copying home dir"
	rsync -a --delete --info=progress2 /tmp/sync /home/chandler
else # Setting up fresh
	# Set up SSH auth from packer content dir
	mkdir -p ~/.ssh
	mv /tmp/content/.ssh/* ~/.ssh/

	# TODO: copy other files from /tmp/content
	# * gnupg
	# * ...


	# Set up Dotfiles
	cd ~
	git init
	git remote add origin git@github.com:ChandlerSwift/dotfiles.git
	git fetch
	git checkout -f arch
	git submodule update --init --recursive  # Vundle
fi

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

[ -d /tmp/content/.ssh ] && mv /tmp/content/.ssh /home/chandler/
[ -d /tmp/content/.gnupg ] && mv /tmp/content/.gnupg /home/chandler/
