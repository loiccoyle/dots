#!/bin/bash

set -e

token="$GH_NOTIF_TOKEN"
count="$(curl -s -u "loiccoyle:${token} https://api.github.com/notifications" | jq '. | length')"
tooltip='Open GitHub notifications'

if [[ "$count" != "0" ]]; then
    printf '{"text":"%s","tooltip":"%s","class":"class"}\n' "$count" "$tooltip"
fi
