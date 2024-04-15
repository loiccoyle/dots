#!/bin/sh

HOST="8.8.8.8"

if ! PING=$(ping -n -c 1 -W 1 "$HOST" 2>/dev/null); then
    echo "No"
else
    RTT=$(echo "$PING" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')
    [ -z "$RTT" ] && echo "" && exit
    echo "$RTT ms"
fi
