#!/bin/sh

VOLUME="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '(?<= )[0-9]+(?=%)' | head -n 1)"
MUTED="$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP '(?<=: ).*' | head -n 1)"

if [ "$MUTED" = "yes" ]; then
    VOLUME="0"
    ICON=""
else
    if [ "$VOLUME" -gt 66 ]; then
        ICON=""
    elif [ "$VOLUME" -gt 33 ]; then
        ICON=""
    elif [ "$VOLUME" -eq 0 ]; then
        ICON=""
    else
        ICON=""
    fi
fi

printf '{"volume": %d, "icon": "%s"}' "$VOLUME" "$ICON"
