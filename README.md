# packer-arch

### Building
```
git clone git@github.com:ChandlerSwift/packer-arch.git
cd packer-arch
make
```

### Packer Notes
Works with Packer 1.4.5. Tested _not_ working with Packer 1.5.6, due to
[this issue](https://github.com/hashicorp/packer/issues/8528), where a new IP
address is generated on machine reboot, and the Packer SSH connector won't
connect. As a workaround, I simply haven't upgraded to Packer 1.5.

### Local mirror
I've been using a local mirror of the arch repos to speed up downloads and save
bandwidth. To set up a mirror, I followed the instructions for
[nginx](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Dynamic_reverse_proxy_cache_using_nginx)
which worked on the first try! The initial run is very slightly slower, but
subsequent runs have a fairly substantial speedup (for me, making a ~30s
process take 3-4 seconds).

### Acknowledgements
Built from [John Gleason's `packer-arch`](https://github.com/jogleasonjr/packer-arch).
