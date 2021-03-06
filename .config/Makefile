# Makefile to install the packages on Arch.
# Requires yay.

INSTALL = sudo pacman -S --needed
INSTALL_AUR = yay -S --needed --removemake

termite: ## Install termite and terminfo
	$(INSTALL) termite termite-terminfo
	$(INSTALL_AUR) vte3-ng

lf: ## Install lf and dependencies
	$(INSTALL_AUR) lf vidir dragon-drag-and-drop
	$(INSTALL) xclip highlight

polybar: rofi fonts ## Install polybar and dependencies
	$(INSTALL_AUR) polybar
	$(INSTALL) pavucontrol-qt

sxhkd: rofi ## Install sxhkd and related programs
	$(INSTALL) libpulse pass xorg-xprop
	$(INSTALL_AUR) sxhkd

sxiv: ## Install sxiv and dependencies
	$(INSTALL) imagemagick sxiv perl-image-exiftool

vim: python_dev ## Install vim
	$(INSTALL) neovim nodejs npm python-pynvim fzf
	$(INSTALL_AUR) neovim-symlinks

python_dev: ## Install python dev setup
	$(INSTALL) python-pip python-pipx python-poetry ipython python-black python-isort python-pylint

rofi: ## Install rofi and rofi extensions
	$(INSTALL) rofi
	$(INSTALL_AUR) rofi-greenclip rofi-bluetooth-git rofi-nordvpn-git rofi-greenclip rofi-emoji rofi-dmenu

ui-theme: ## Install ui themes
	$(INSTALL) qt5ct
	$(INSTALL_AUR) adwaita-qt
	@echo "Run 'qt5ct' and select adwaita"

qutebrowser: ## Install qutebrowser and adblock
	$(INSTALL) qutebrowser python-adblock

fonts: ## Install fonts
	$(INSTALL) noto-fonts noto-fonts-emoji ttf-hack
	$(INSTALL_AUR) siji ttf-unifont

flavours: ## Install flavours
	$(INSTALL_AUR) flavours
	flavours update all

torrents: python_dev ## Install torrenting setup, with transmission
	pipx install rofi-tpb
	$(INSTALL) transmission-cli mpv
	$(INSTALL_AUR) webtorrent-cli

hooks: ## Install pacman cleanup and mirrorlist hooks
	$(INSTALL_AUR) pacman-cleanup-hook reflector-mirrorlist-update

scripts: ## Install script dependencies
	$(INSTALL) ffmpeg xdotool hsetroot maim xclip

startup: sxhkd ## Startup programs (.xprofile)
	$(INSTALL) kbd xorg-xset xorg-xsetroot hsetroot picom dunst udiskie

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

test: ## Test this Makefile with docker
	docker build --rm -t dotfiles ${PWD};\
	docker run --rm -it --name maketest -d dotfiles:latest;\
	docker exec -it maketest sh -c "cd ${PWD}; make all";\

all: termite lf polybar sxhkd sxiv vim python_dev rofi ui-theme qutebrowser fonts flavours torrents hooks scripts startup ## Install everything

.DEFAULT_GOAL := help

.PHONY: lf polybar sxhkd sxiv vim python_dev rofi ui-theme qutebrowser fonts flavours torrents hooks test help
