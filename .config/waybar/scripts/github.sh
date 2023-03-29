#!/usr/bin/env bash

set -e

if [ -z "$GH_NOTIF_TOKEN" ]; then
    echo "GH_NOTIF_TOKEN not set" >&2
    exit 1
fi

RESPONSE="$(curl -s -u "loiccoyle:$GH_NOTIF_TOKEN" "https://api.github.com/notifications")"

if echo "$RESPONSE" | jq -e 'has("message")?' >/dev/null; then
    echo "Bad credentials" >&2
    echo "$RESPONSE" >&2
    exit 1
fi

COUNT="$(echo "$RESPONSE" | jq '. | length')"
TOOLTIP='Open GitHub notifications'

if [[ "$COUNT" != "0" ]]; then
    printf '{"text":"%s","tooltip":"%s","class":"class"}\n' "$COUNT" "$TOOLTIP"
fi
