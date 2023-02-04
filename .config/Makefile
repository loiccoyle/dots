# Makefile to install dotfile related packages on ArchLinux.
# Requires paru

INSTALL = sudo pacman -S --needed
INSTALL_AUR = paru -S --needed --removemake

.PHONY: terminal
terminal: ## Install terminal application
	$(INSTALL) alacritty
	$(INSTALL_AUR) xterm-alacritty-symlink

.PHONY: file-manager
file-manager: ## Install file manager and dependencies
	$(INSTALL_AUR) lf vidir dragon-drop ix
	$(INSTALL) xclip highlight

.PHONY: bar
bar: launcher fonts ## Install bar and dependencies
	$(INSTALL_AUR) polybar bluez-utils
	$(INSTALL) pavucontrol-qt

.PHONY: hotkeys
hotkeys: launcher scripts terminal ## Install hotkey daemon and related programs
	$(INSTALL) sxhkd libpulse pass xorg-xprop playerctl

.PHONY: image-viewer
image-viewer: ## Install image viewer and dependencies
	$(INSTALL_AUR) vimiv-qt-git python-exiv2

.PHONY: editor
editor: ## Install text editor and dependencies
	$(INSTALL) neovim nodejs npm python-pynvim ripgrep ripgrep-all
	$(INSTALL_AUR) neovim-symlinks

.PHONY: dev
dev: dev_python dev_sh dev_c dev_lua dev_web dev_rust ## Install dev setup

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
	$(INSTALL_AUR) stylua

.PHONY: dev_rust
dev_rust: ## rust dev setup
	$(INSTALL) rustup rust-src

.PHONY: dev_web
dev_web: ## web dev setup
	$(INSTALL) prettier eslint

.PHONY: launcher
launcher: ## Install launcher and exentions
	$(INSTALL) rofi rofi-emoji rofi-calc
	$(INSTALL_AUR) rofi-greenclip rofi-nordvpn-git rofi-greenclip

.PHONY: ui-theme
ui-theme: ## Install ui themes
	$(INSTALL) qt5ct
	$(INSTALL_AUR) adwaita-qt la-capitaine-icon-theme
	@echo "Run 'qt5ct' and select adwaita"

.PHONY: browser
browser: file-manager ## Install browser and dependencies
	$(INSTALL) firefox

.PHONY: fonts
fonts: ## Install fonts
	$(INSTALL) noto-fonts noto-fonts-emoji ttf-hack ttf-nerd-fonts-symbols

.PHONY: flavours
flavours: ## Colourscheme manager
	$(INSTALL_AUR) flavours
	flavours update all
	flavours apply gruvbox-dark-hard

.PHONY: torrents
torrents: ## Install torrenting setup, with transmission
	$(INSTALL) transmission-cli mpv
	$(INSTALL_AUR) prowlarr rofi-prowlet-git webtorrent-cli

.PHONY: hooks
hooks: ## Install pacman hooks
	$(INSTALL_AUR) pacman-cleanup-hook reflector-mirrorlist-update

.PHONY: scripts
scripts: ## Install script dependencies
	$(INSTALL) ffmpeg hsetroot shotgun slop xclip xdotool python-pipx
	$(INSTALL_AUR) thqm
	pipx install hag

.PHONY: startup
startup: hotkeys ## Startup programs (xinit and .xprofile)
	$(INSTALL) xorg-xinit kbd xorg-xset xorg-xsetroot hsetroot picom dunst udiskie network-manager-applet blueman unclutter

.PHONY: other
other: ## Other useful software
	$(INSTALL) lazygit rsync arandr yt-dlp fzf zoxide jq
	$(INSTALL_AUR) shazam-cli-git nvimpager

.PHONY: walls
walls: ## Fetch wallpapers
	[ -d ${WALLPAPER_DIR} ] || git clone https://github.com/loiccoyle/walls ${WALLPAPER_DIR}

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
all: terminal file-manager bar hotkeys image-viewer editor dev launcher ui-theme browser fonts flavours torrents hooks scripts startup other walls ## Install everything

.DEFAULT_GOAL := help
