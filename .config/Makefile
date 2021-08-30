# Makefile to install the packages on Arch.
# Requires paru

INSTALL = sudo pacman -S --needed
INSTALL_AUR = paru -S --needed --removemake

.PHONY: alacritty
alacritty: ## Install alacritty
	$(INSTALL_AUR) alacritty

.PHONY: lf
lf: ## Install lf and dependencies
	$(INSTALL_AUR) lf vidir dragon-drag-and-drop ix
	$(INSTALL) xclip highlight

.PHONY: polybar
polybar: rofi fonts ## Install polybar and dependencies
	$(INSTALL_AUR) polybar
	$(INSTALL) pavucontrol-qt

.PHONY: sxhkd
sxhkd: rofi scripts ## Install sxhkd and related programs
	$(INSTALL) libpulse pass xorg-xprop playerctl
	$(INSTALL_AUR) sxhkd

.PHONY: vimiv
vimiv: ## Install vimiv and dependencies
	$(INSTALL_AUR) vimiv-qt-git python-exiv2

.PHONY: vim
vim: ## Install neovim and related
	$(INSTALL) neovim nodejs npm python-pynvim fzf
	$(INSTALL_AUR) neovim-symlinks

.PHONY: dev
dev: dev_python dev_sh dev_c dev_lua dev_web ## Install dev setup

.PHONY: dev_python
dev_python: ## Python dev setup
	$(INSTALL) python-pipx python-poetry pyenv ipython python-black

.PHONY: dev_sh
dev_sh: ## sh dev setup
	$(INSTALL) shfmt
	$(INSTALL_AUR) shellcheck-bin

.PHONY: dev_c
dev_c: ## C dev setup
	$(INSTALL) clang

.PHONY: dev_lua
dev_lua: ## lua dev setup
	$(INSTALL_AUR) stylua-git

.PHONY: dev_web
dev_web: ## web dev setup
	$(INSTALL) prettier eslint

.PHONY: rofi
rofi: ## Install rofi and rofi extensions
	$(INSTALL) rofi
	$(INSTALL_AUR) rofi-greenclip rofi-bluetooth-git rofi-nordvpn-git rofi-greenclip rofi-emoji rofi-dmenu

.PHONY: ui-theme
ui-theme: ## Install ui themes
	$(INSTALL) qt5ct
	$(INSTALL_AUR) adwaita-qt la-capitaine-icon-theme
	@echo "Run 'qt5ct' and select adwaita"

.PHONY: qutebrowser
qutebrowser: ## Install qutebrowser and adblock
	$(INSTALL) qutebrowser python-adblock

.PHONY: fonts
fonts: ## Install fonts
	$(INSTALL) noto-fonts noto-fonts-emoji ttf-hack ttf-font-awesome ttf-nerd-fonts-symbols

.PHONY: flavours
flavours: ## Install flavours and run 'flavours update'
	$(INSTALL_AUR) flavours
	flavours update all

.PHONY: torrents
torrents: ## Install torrenting setup, with transmission
	$(INSTALL) transmission-cli mpv
	$(INSTALL_AUR) jackett-bin rofi-cuff-git webtorrent-cli

.PHONY: hooks
hooks: ## Install pacman hooks
	$(INSTALL_AUR) pacman-cleanup-hook reflector-mirrorlist-update

.PHONY: scripts
scripts: ## Install script dependencies
	$(INSTALL) ffmpeg hsetroot shotgun slop xclip xdotool

.PHONY: startup
startup: sxhkd ## Startup programs (xinit and .xprofile)
	$(INSTALL) xorg-xinit kbd xorg-xset xorg-xsetroot hsetroot picom dunst udiskie network-manager-applet blueman unclutter

.PHONY: other
other: ## Other useful software
	$(INSTALL) lazygit rsync

.PHONY: walls
walls: ## Fetch wallpapers
	git clone https://github.com/loiccoyle/walls ${WALLPAPER_DIR}

.PHONY: test
test: ## Test this Makefile with docker
	docker build --rm -t dotfiles ${PWD};\
	docker run --rm -it --name maketest -d dotfiles:latest;\
	docker exec -it maketest sh -c "cd /home/dots/.config; make all";\

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: all
all: alacritty lf polybar sxhkd vimiv vim dev rofi ui-theme qutebrowser fonts flavours torrents hooks scripts startup other walls ## Install everything

.DEFAULT_GOAL := help
