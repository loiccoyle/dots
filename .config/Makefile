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
	# for ctpv
	gpg --receive-keys 6E656AC5B97B5133
	$(INSTALL_AUR) lf vidir dragon-drop ix ctpv-git
	$(INSTALL) xclip highlight perl-image-exiftool ueberzug atool

.PHONY: bar
bar: launcher fonts ## Install bar and dependencies
	$(INSTALL_AUR) polybar bluez-utils
	$(INSTALL) pavucontrol

.PHONY: hotkeys
hotkeys: launcher scripts terminal ## Install hotkey daemon and related programs
	$(INSTALL) sxhkd libpulse pass xorg-xprop playerctl

.PHONY: image-viewer
image-viewer: ## Install image viewer and dependencies
  # gpg key for python-exiv2
	gpg --keyserver keyserver.ubuntu.com --recv-keys 068346EEA7A91F52
	$(INSTALL_AUR) vimiv-qt-git python-exiv2

.PHONY: editor
editor: ## Install text editor and dependencies
	$(INSTALL) neovim nodejs npm python-pynvim ripgrep ripgrep-all
	$(INSTALL_AUR) neovim-symlinks

.PHONY: dev
dev: dev_python dev_c dev_rust ## Install dev setup

.PHONY: dev_python
dev_python: ## Python dev setup
	$(INSTALL) python-pipx python-poetry pyenv ipython

.PHONY: dev_c
dev_c: ## C dev setup
	$(INSTALL) clang

.PHONY: dev_rust
dev_rust: ## rust dev setup
	$(INSTALL) rustup rust-src
	rustup default stable

.PHONY: launcher
launcher: ## Install launcher and extensions
	$(INSTALL) rofi rofi-emoji rofi-calc
	$(INSTALL_AUR) rofi-greenclip rofi-nordvpn-git

.PHONY: ui-theme
ui-theme: ## Install ui themes
	$(INSTALL) qt5ct
	$(INSTALL_AUR) adwaita-qt5 la-capitaine-icon-theme
	@echo "Run 'qt5ct' and select adwaita"

.PHONY: browser
browser: file-manager ## Install browser
	$(INSTALL) firefox
	$(INSTALL_AUR) python-pywalfox
	sudo pywalfox install -g
	@echo "Install the pywalfox extension for colour scheme integration"
	@echo "https://github.com/frewacom/pywalfox"

.PHONY: fonts
fonts: ## Install fonts
	$(INSTALL) noto-fonts noto-fonts-emoji ttf-hack ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-2048-em

.PHONY: flavours
flavours: ## Colourscheme manager
	$(INSTALL_AUR) flavours
# Don't do this if in a docker container because the cloning fails as ssh isn't set up.
# So the test recipe doesn't fail.
ifeq ("$(wildcard /.dockerenv)","")
	flavours update all
	flavours apply gruvbox-dark-hard
endif

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
	$(INSTALL) gh lazygit rsync arandr yt-dlp fzf zoxide jq
	$(INSTALL_AUR) shazam-cli-git nvimpager sioyek-git

.PHONY: walls
walls: ## Fetch wallpapers
	[ -d ${WALLPAPER_DIR} ] || git clone https://github.com/loiccoyle/walls ${WALLPAPER_DIR}

.PHONY: wayland
wayland: hyprland waybar ## Wayland wm

.PHONY: hyprland
hyprland: wayland-utils ## Install hyprland
	$(INSTALL_AUR) hyprland grimblast-git waybar-hyprland-git

.PHONY: wayland-utils
wayland-utils: ## Install wayland utils
	$(INSTALL) swaylock swayidle swaybg light grim slurp wf-recorder wl-clipboard
	$(INSTALL_AUR) wdisplays way-displays cliphist hyprpicker-git

.PHONY: waybar
waybar: wayland-utils ## Install waybar
	$(INSTALL) gnome-system-monitor

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
