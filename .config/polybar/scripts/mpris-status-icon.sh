#!/bin/sh
#
# Requires playerctl

to_icon() {
    while IFS= read -r event; do
        if ! playerctl metadata >/dev/null 2>&1; then
            # if no player is available hide the module
            echo ""
            polybar-msg hook mpris-song 1 >/dev/null 2>&1
            sleep 0.05
            polybar-msg hook mpris-prev 1 >/dev/null 2>&1
            sleep 0.05
            polybar-msg hook mpris-next 1 >/dev/null 2>&1
        else
            polybar-msg hook mpris-song 2 >/dev/null 2>&1
            sleep 0.05
            polybar-msg hook mpris-prev 2 >/dev/null 2>&1
            sleep 0.05
            polybar-msg hook mpris-next 2 >/dev/null 2>&1
            case $event in
            "Playing")
                echo ""
                ;;
            "Stopped" | "Paused")
                echo ""
                ;;
            *)
                echo "$event"
                ;;
            esac
        fi
    done
}

playerctl status --follow | to_icon
