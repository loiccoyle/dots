#!/usr/bin/env bash

status="$(nordvpn status | tr -d '\r -' | grep -i status)"

if [[ "$status" =~ "Connected" ]]; then
    nordvpn disconnect
else
    nordvpn connect
fi
