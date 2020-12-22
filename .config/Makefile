# Makefile to install the packages on Arch.
# Note: requires yay.

lf:
	yay -S lf vidir dragon-drag-and-drop
	sudo pacman -S xclip

polybar: rofi fonts
	yay -S polybar-git
	sudo pacman -S pavucontrol-qt

sxhkd: rofi
	sudo pacman -S libpulse pass
	yay -S sxhkd

sxiv:
	sudo pacman -S imagemagick sxiv sxiv-rifle perl-image-exiftool

vim: python_dev
	sudo pacman -S neovim nodejs python-pynvim
	yay -S fzf

python_dev:
	sudo pacman -S python-pip python-pipx python-poetry ipython python-black python-isort python-pylint

rofi:
	sudo pacman -S rofi
	yay -S greenclip rofi-bluetooth-git rofi-greenclip rofi-emoji rofi-dmenu

ui-theme:
	sudo pacman -S qt5ct
	yay -S adwaita-qt
	echo "Run 'qt5ct' and select adwaita"

qutebrowser:
	sudo pacman -S qutebrowser

fonts:
	sudo pacman -S noto-fonts noto-fonts-emoji ttf-unifont ttf-hack
	yay -S siji-git

flavours:
	yay -S flavours
	flavours update all

tpb:
	pipx install rofi-tpb
	sudo pacman -S transmission-cli
	yay -S webtorrent-cli
.PHONY: lf polybar sxhkd sxiv vim python_dev rofi ui-theme qutebrowser fonts flavours
