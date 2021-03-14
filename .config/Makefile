# Makefile to install the packages on Arch.
# Requires yay.

termite: ## Install termite and terminfo
	sudo pacman -S termite termite-terminfo
	yay -S vte3-ng

lf: ## Install lf and dependencies
	yay -S lf vidir dragon-drag-and-drop
	sudo pacman -S xclip highlight

polybar: rofi fonts ## Install polybar and dependencies
	yay -S polybar
	sudo pacman -S pavucontrol-qt

sxhkd: rofi ## Install sxhkd and related programs
	sudo pacman -S libpulse pass xorg-xprop
	yay -S sxhkd

sxiv: ## Install sxiv and dependencies
	sudo pacman -S imagemagick sxiv perl-image-exiftool

vim: python_dev ## Install vim
	sudo pacman -S neovim nodejs python-pynvim
	yay -S fzf neovim-symlinks

python_dev: ## Install python dev setup
	sudo pacman -S python-pip python-pipx python-poetry ipython python-black python-isort python-pylint

rofi: ## Install rofi and rofi extensions
	sudo pacman -S rofi
	yay -S greenclip rofi-bluetooth-git rofi-nordvpn-git rofi-greenclip rofi-emoji rofi-dmenu

ui-theme: ## Install ui themes
	sudo pacman -S qt5ct
	yay -S adwaita-qt
	@echo "Run 'qt5ct' and select adwaita"

qutebrowser: ## Install qutebrowser and adblock
	yay -S qutebrowser python-adblock

fonts: ## Install fonts
	sudo pacman -S noto-fonts noto-fonts-emoji ttf-hack
	yay -S siji ttf-unifont

flavours: ## Install flavours
	yay -S flavours
	flavours update all

torrents: python_dev ## Install torrenting setup, with transmission
	pipx install rofi-tpb
	sudo pacman -S transmission-cli mpv
	yay -S webtorrent-cli

hooks: ## Install pacman cleanup and mirrorlist hooks
	yay -S pacman-cleanup-hook reflector-mirrorlist-update

scripts: ## Install script dependencies
	sudo pacman -S ffmpeg xdotool hsetroot maim xclip

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

test: ## Test this Makefile with docker
	docker build --rm -t dotfiles ${PWD};\
	docker run --rm -it --name maketest -d dotfiles:latest;\
	docker exec -it maketest sh -c "cd ${PWD}; make all";\

all: termite lf polybar sxhkd sxiv vim python_dev rofi ui-theme qutebrowser fonts flavours torrents hooks scripts ## Install everything

.DEFAULT_GOAL := help

.PHONY: lf polybar sxhkd sxiv vim python_dev rofi ui-theme qutebrowser fonts flavours torrents hooks test help
