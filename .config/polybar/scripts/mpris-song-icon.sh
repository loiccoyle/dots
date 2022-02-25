#!/bin/sh
#
# Requires playerctl

declare -A ICON_MAP
ICON_MAP[default]=""
ICON_MAP[mpv]=""
ICON_MAP[vlc]="嗢"
ICON_MAP[chromium]=""
ICON_MAP[firefox]=""
ICON_MAP[qutebrowser]=""

to_icon() {
    while IFS= read -r event; do
        playername="${event%_SPLIT_STRING_*}"
        event="${event#*_SPLIT_STRING_}"
        case "${event,,}" in
        *"twitch"*)
            PLAYER_ICON=""
            event=${event/ - Twitch/}
            ;;
        *"youtube"*)
            PLAYER_ICON=""
            ;;
        *)
            PLAYER_ICON="${ICON_MAP[${playername}]}"
            [ -z "$PLAYER_ICON" ] && PLAYER_ICON="${ICON_MAP[default]}"
            ;;
        esac
        echo "${PLAYER_ICON} ${event}"
    done
}

playerctl metadata --format "{{playerName}}_SPLIT_STRING_${1}" 2>/dev/null | to_icon
