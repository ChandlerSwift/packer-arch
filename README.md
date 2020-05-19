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

### Acknowledgements
Built from [John Gleason's `packer-arch`](https://github.com/jogleasonjr/packer-arch).
