# Makefile to install the packages on Arch.
# Requires paru

INSTALL = sudo pacman -S --needed
INSTALL_AUR = paru -S --needed --removemake

alacritty: ## Install alacritty
	$(INSTALL_AUR) alacritty

lf: ## Install lf and dependencies
	$(INSTALL_AUR) lf vidir dragon-drag-and-drop ix
	$(INSTALL) xclip highlight

polybar: rofi fonts ## Install polybar and dependencies
	$(INSTALL_AUR) polybar
	$(INSTALL) pavucontrol-qt

sxhkd: rofi ## Install sxhkd and related programs
	$(INSTALL) libpulse pass xorg-xprop playerctl
	$(INSTALL_AUR) sxhkd

sxiv: ## Install sxiv and dependencies
	$(INSTALL) imagemagick sxiv perl-image-exiftool

vimiv: ## Install vimiv and dependencies
	$(INSTALL_AUR) vimiv-qt-git python-exiv2

vim: ## Install neovim and related
	$(INSTALL) neovim nodejs npm python-pynvim fzf
	$(INSTALL_AUR) neovim-symlinks

dev: dev_python dev_bash dev_c ## Install dev setup

dev_python: ## Python dev setup
	$(INSTALL) python-pip python-pipx python-poetry pyenv ipython python-black python-isort python-pylint

dev_sh: ## sh dev setup
	$(INSTALL) bash-language-server
	$(INSTALL_AUR) shellcheck-bin

dev_c: ## C dev setup
	$(INSTALL) ccls

rofi: ## Install rofi and rofi extensions
	$(INSTALL) rofi
	$(INSTALL_AUR) rofi-greenclip rofi-bluetooth-git rofi-nordvpn-git rofi-greenclip rofi-emoji rofi-dmenu

ui-theme: ## Install ui themes
	$(INSTALL) qt5ct
	$(INSTALL_AUR) adwaita-qt la-capitaine-icon-theme
	@echo "Run 'qt5ct' and select adwaita"

qutebrowser: ## Install qutebrowser and adblock
	$(INSTALL) qutebrowser python-adblock

fonts: ## Install fonts
	$(INSTALL) noto-fonts noto-fonts-emoji ttf-hack ttf-font-awesome ttf-nerd-fonts-symbols
	$(INSTALL_AUR) ttf-unifont 

flavours: ## Install flavours and run 'flavours update'
	$(INSTALL_AUR) flavours
	flavours update all

torrents: ## Install torrenting setup, with transmission
	$(INSTALL) transmission-cli mpv
	$(INSTALL_AUR) jackett-bin rofi-cuff-git webtorrent-cli

hooks: ## Install pacman hooks
	$(INSTALL_AUR) pacman-cleanup-hook reflector-mirrorlist-update

scripts: ## Install script dependencies
	$(INSTALL) ffmpeg hsetroot shotgun slop xclip

startup: sxhkd ## Startup programs (xinit and .xprofile)
	$(INSTALL) xorg-xinit kbd xorg-xset xorg-xsetroot hsetroot picom dunst udiskie network-manager-applet blueman

other: ## Other useful software
	$(INSTALL) lazygit

test: ## Test this Makefile with docker
	docker build --rm -t dotfiles ${PWD};\
	docker run --rm -it --name maketest -d dotfiles:latest;\
	docker exec -it maketest sh -c "cd ${PWD}; make all";\

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: alacritty lf polybar sxhkd sxiv vim dev rofi ui-theme qutebrowser fonts flavours torrents hooks scripts startup other ## Install everything

.DEFAULT_GOAL := help

.PHONY: alacritty lf polybar sxhkd sxiv vimiv vim dev dev_python dev_bash dev_c rofi ui-theme qutebrowser fonts flavours torrents hooks test help
