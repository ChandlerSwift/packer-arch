#!/bin/sh

# Set up SSH auth from packer content dir
mkdir -p ~/.ssh
mv /tmp/content/.ssh/* ~/.ssh/

if [ "$COPY_HOMEDIR" = "true" ]; then
	echo "Copying home dir"
	ssh-keyscan pearson-dev.edenprairie.chandlerswift.com >> ~/.ssh/known_hosts
	rsync --archive --delete --info=progress2 pearson-dev.edenprairie.chandlerswift.com:/home/chandler/ /home/chandler/
else
	# Set up Dotfiles
	cd ~
	git init
	git remote add origin git@github.com:ChandlerSwift/dotfiles.git
	git fetch
	git checkout -f arch
	git submodule update --init --recursive  # Vundle

	# Install Vim packages
	vim +PluginInstall +qall
fi

# Set zsh to default shell
sudo chsh -s /usr/bin/zsh chandler

# Remove password
sudo passwd -d chandler

# Enable systemd time syncing
sudo systemctl enable systemd-timesyncd.service
sudo systemctl start systemd-timesyncd.service

# Set up Docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker chandler
