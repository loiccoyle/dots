# Makefile to install the packages.

lf:
	yay -S lf-git vidir dragon-drag-and-drop
	sudo pacman -S xclip

polybar: rofi
	sudo pacman -S ttf-hack ttf-unifont
	yay -S siji-git polybar-git pavucontrol-qt

sxhkd: rofi
	sudo pacman -S libpulse
	yay -S sxhkd-git

sxiv:
	sudo pacman -S imagemagick sxiv sxiv-rifle perl-image-exiftool

vim:
	sudo pacman -S neovim
	yay -S fzf-git

rofi:
	sudo pacman -S rofi
	yay -S greenclip rofi-bluetooth-git rofi-greenclip rofi-emoji rofi-dmenu

ui-theme:
	sudo pacman -S qt5ct
	yay -S adwaita-qt

qutebrowser:
	sudo pacman -S qutebrowser
	git clone https://gitlab.com/jjzmajic/qutewal ~/.config/qutebrowser/qutewal
	ln -s ~/.config/qutebrowser/qutewal/qutewal.py ~/.config/qutebrowser/qutewal.py

.PHONY: lf polybar sxhkd sxiv vim rofi ui-theme qutebrowser
