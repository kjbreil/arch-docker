
DOCKER_CMD?=not yet

ARCH_BASE?=uhh


.PHONY: default init all rootfs images release clone pull push

default: images

init: clone pull

all: rootfs images

rootfs:
	cd arch-base && $(MAKE) rootfs

images:
	cd arch-base && $(MAKE)
	cd arch-build && $(MAKE)
	cd arch-makepkg && $(MAKE)

release:
	cd arch-base && $(MAKE) release
	cd arch-build && $(MAKE) release

clone:
	git clone https://github.com/kjbreil/arch-base.git
	git clone https://github.com/kjbreil/arch-build.git
	git clone https://github.com/kjbreil/arch-apacman.git

pull:
	-cd arch-base && git pull 
	-cd arch-build && git pull 
	-cd arch-apacman && git pull 

pack:
	cd arch-makepkg && $(MAKE) images
	cd arch-makepkg && $(MAKE) run
	cd arch-makepkg && $(MAKE) pack
