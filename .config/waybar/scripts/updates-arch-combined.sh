#!/usr/bin/env bash
#
# Check for pakages updates, from pacman and the AUR.
# Requires pacman-contrib, paru, dunstify (optional).

UPDATE_FILE_TMP="/tmp/polybar_updates_arch_combined"
[ ! -f "$UPDATE_FILE_TMP" ] && printf "0\n" >"$UPDATE_FILE_TMP"

UPDATES_ARCH="$(checkupdates 2>/dev/null | wc -l)" || UPDATES_ARCH=0
UPDATES_AUR="$(paru -Qum 2>/dev/null | wc -l)" || UPDATES_AUR=0

UPDATES=$(("$UPDATES_ARCH" + "$UPDATES_AUR"))

PREVIOUS_UPDATES="$(cat "$UPDATE_FILE_TMP")"
if [ "$UPDATES" -gt "$PREVIOUS_UPDATES" ]; then
    if type dunstify >/dev/null; then
        [ "$(dunstify -i "system-software-update" \
            "Software Update" \
            "$UPDATES update(s) available." \
            --action="update,udpate")" = "update" ] && $TERMINAL --hold --class=float -e "paru" &
    else
        notify-send -i "system-software-update" "Software Update" "$UPDATES update(s) available."
    fi
fi
printf "%s\n" "$UPDATES" >"$UPDATE_FILE_TMP"

if [ "$UPDATES" -gt 0 ]; then
    printf '{"text": "%s", "tooltip": "Update packages"}\n' "$UPDATES"
else
    printf "\n"
fi
