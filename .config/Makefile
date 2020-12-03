# Makefile to install the packages on Arch.
# Note: requires yay.

lf:
	yay -S lf-git vidir dragon-drag-and-drop
	sudo pacman -S xclip

polybar: rofi fonts
	yay -S polybar-git
	sudo pacman -S pavucontrol-qt

sxhkd: rofi
	sudo pacman -S libpulse pass
	yay -S sxhkd-git

sxiv:
	sudo pacman -S imagemagick sxiv sxiv-rifle perl-image-exiftool

vim: python_dev
	sudo pacman -S neovim nodejs
	yay -S fzf-git
	cd ~/.config/nvim && ./make_venv && cd -

python_dev:
	sudo pacman -S python-pip python-pipx python-poetry ipython python-black python-isort python-pylint

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

fonts:
	sudo pacman -S noto-fonts noto-fonts-emoji ttf-unifont ttf-hack
	yay -S siji-git

flavours:
	yay -S flavours
	flavours update all

.PHONY: lf polybar sxhkd sxiv vim python_dev rofi ui-theme qutebrowser fonts flavours
