#!/bin/bash
#
# Check for pakages updates, from pacman and the AUR.
# Requires pacman-contrib, paru, dunstify (optional).

UPDATE_FILE_TMP="/tmp/eww_updates_arch"
[ ! -f "$UPDATE_FILE_TMP" ] && printf "" >"$UPDATE_FILE_TMP"

# fetch the packages that need updates, sort them
TO_UPDATE="$(cat <(checkupdates --nocolor) <(paru -Qum) | sort)"
# count them
N_UPDATES="$(echo "$TO_UPDATE" | wc -l)"
# and convert to a json array
TO_UPDATE="$(printf "%s" "$TO_UPDATE" | jq -R -s -c 'split("\n")')"

PREVIOUS_TO_UPDATE="$(cat "$UPDATE_FILE_TMP")"
if [ "$TO_UPDATE" != "$PREVIOUS_TO_UPDATE" ]; then
    if type dunstify >/dev/null; then
        ([ "$(dunstify -i "system-software-update" \
            "Software Update" \
            "$N_UPDATES update(s) available." \
            --action="update,update")" = "update" ] && $TERMINAL --hold --class=float -e "paru") &
        disown -h
    fi
else
    notify-send -i "system-software-update" "Software Update" "$N_UPDATES update(s) available." &
fi
printf "%s" "$TO_UPDATE" >"$UPDATE_FILE_TMP"

printf '{"packages": %s, "n_packages": %d}' "$TO_UPDATE" "$N_UPDATES"
