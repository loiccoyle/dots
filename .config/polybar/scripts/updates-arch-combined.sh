#!/bin/sh
#
# Check for pakages updates, from pacman and the AUR.
# Requires pacman-contrib, paru

if ! UPDATES_ARCH=$(checkupdates 2> /dev/null | wc -l ); then
    UPDATES_ARCH=0
fi

# if ! UPDATES_AUR=$(yay -Qum 2> /dev/null | wc -l); then
if ! UPDATES_AUR=$(paru -Qum 2> /dev/null | wc -l); then
    UPDATES_AUR=0
fi

UPDATES=$(("$UPDATES_ARCH" + "$UPDATES_AUR"))

if [ "$UPDATES" -gt 0 ]; then
    printf " %s" "$UPDATES"
else
    printf "\n"
fi
