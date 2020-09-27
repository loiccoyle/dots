# Makefile to install the packages.

lf:
	yay -S lf-git vidir dragon-drag-and-drop
	sudo pacman -S xclip

polybar:
	yay -S rofi-bluetooth-git polybar-git pavucontrol-qt

sxhkd:
	yay -S rofi-bluetooth-git rofi-greenclip greenclip sxhkd-git
	sudo pacman -S libpulse rofi

sxiv:
	sudo pacman -S imagemagick sxiv sxiv-rifle perl-image-exiftool

vim:
	sudo pacman -S neovim
	yay -S fzf-git

rofi:
	sudo pacman -S rofi
	yay -S rofi-bluetooth-git rofi-greenclip rofi-emoji rofi-dmenu

ui-theme:
	sudo pacman -S qt5ct
	yay -S adwaita-qt

qutebrowser:
	sudo pacman -S qutebrowser
	git clone https://gitlab.com/jjzmajic/qutewal ~/.config/qutebrowser/qutewal
	ln -s ~/.config/qutebrowser/qutewal/qutewal.py ~/.config/qutebrowser/qutewal.py

.PHONY: lf polybar sxhkd sxiv vim rofi ui-theme qutebrowser
