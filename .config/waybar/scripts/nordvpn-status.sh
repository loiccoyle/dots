#!/usr/bin/env bash

status="$(nordvpn status | tr -d '\r -')"

if [ -n "${status##*Connected*}" ]; then
    text=""
    class="off"
    tooltip="Connect to NordVPN"
else
    text=" $(printf "%s" "$status" | grep "City" | cut -d ":" -f 2)"
    class="on"
    tooltip="Disconnect from NordVPN"
fi

printf '{"text":"%s","class":"%s","tooltip":"%s"}\n' "$text" "$class" "$tooltip"
