#!/usr/bin/env bash

set -e

TOKEN="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"
RESPONSE="$(curl -s -u "loiccoyle:$TOKEN" "https://api.github.com/notifications")"

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
