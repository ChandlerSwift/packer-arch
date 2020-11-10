.PHONY: help
help:
	@echo "make [build|sync_home]"

.PHONY: build
build:
	packer build archlinux.json

.PHONY: sync_home
sync_home:
	packer build -var 'copy_homedir=true' archlinux.json
