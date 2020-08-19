.PHONY: help
help:
	@echo "make [build|sync_home]"

.PHONY: build
build:
	packer build archlinux.json

.PHONY: sync_home
sync_home:
	#rsync --archive --delete --info=progress2 chandler@172.16.18.200: sync
	packer build -var 'copy_homedir=true' archlinux.json
