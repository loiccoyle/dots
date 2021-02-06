#!/bin/sh

echo "---"  >> /tmp/polybar1.log

polybar --reload top >> /tmp/polybar1.log 2>&1 &

echo "Bars launched..."
