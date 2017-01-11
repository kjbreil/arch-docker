
DOCKER_CMD?=not yet

ARCH_BASE?=uhh


.PHONY: default runmake

default: runmake

init: clone pull

images:
	cd arch-base && $(MAKE) rootfs
	cd arch-base && $(MAKE)
	cd arch-build && $(MAKE)
	cd arch-apacman && $(MAKE)

release:
	cd arch-base && $(MAKE) release
	cd arch-build && $(MAKE) release
	cd arch-build && $(MAKE) release

clone:
	git clone https://github.com/kjbreil/arch-base.git
	git clone https://github.com/kjbreil/arch-build.git
	git clone https://github.com/kjbreil/arch-apacman.git

pull:
	-cd arch-base && git pull 
	-cd arch-build && git pull 
	-cd arch-apacman && git pull 

push:
	cd arch-base && git push 
	cd arch-build && git push 
	cd arch-apacman && git push 
