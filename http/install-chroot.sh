#!/bin/bash

set -e
set -x

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

echo 'archlinux' > /etc/hostname

sed -i -e 's/^#\(en_US.UTF-8\)/\1/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

mkinitcpio -p linux

useradd -m -U chandler
passwd -d chandler
cat <<EOF > /etc/sudoers.d/chandler
Defaults:chandler !requiretty
chandler ALL=(ALL) NOPASSWD: ALL
EOF
chmod 440 /etc/sudoers.d/chandler

mkdir -p /etc/systemd/network
ln -sf /dev/null /etc/systemd/network/99-default.link

systemctl enable sshd
systemctl enable dhcpcd

grub-install "$device"
sed -i -e 's/^GRUB_TIMEOUT=.*$/GRUB_TIMEOUT=1/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
