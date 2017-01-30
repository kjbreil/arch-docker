
DOCKER_CMD?=not yet

ARCH_BASE?=uhh


.PHONY: default init all rootfs images arch-base arch-build arch-yaourt arch-plex release clone pull push clean rm_ps rm_im arch-pacstrap

default: images

init: clone pull

all: rootfs clean images

rootfs:
	cd arch-base && $(MAKE) rootfs

images: arch-base arch-build arch-yaourt

arch-base:
	cd arch-base && $(MAKE)

arch-build:
	cd arch-build && $(MAKE)

arch-yaourt:
	cd arch-yaourt && $(MAKE)

arch-plex:
	cd arch-plex && $(MAKE)

arch-pacstrap:
	cd arch-pacstrap && $(MAKE)

release:
	cd arch-base && $(MAKE) release
	cd arch-build && $(MAKE) release
	cd arch-yaourt && $(MAKE) release

push:
	cd arch-base && $(MAKE) push
	cd arch-build && $(MAKE) push
	cd arch-yaourt && $(MAKE) push

heim:
	cd arch-base && $(MAKE) heim
	cd arch-build && $(MAKE) heim
	cd arch-yaourt && $(MAKE) heim

clone:
	-git clone git@github.com:kjbreil/arch-base.git
	-git clone git@github.com:kjbreil/arch-build.git
	-git clone git@github.com:kjbreil/arch-yaourt.git
	-git clone git@github.com:kjbreil/transcode.git

pull:
	-cd arch-base && git pull 
	-cd arch-build && git pull 
	-cd arch-yaourt && git pull 
	-cd transcod && git pull

clean: rm_ps rm_im

rm_ps:
	-docker rm -f $$(docker ps -aq)

rm_im:
	-docker rmi -f $$(docker images -aq)