#!/bin/sh
#
# Requires bluetoothctl

# Checks if bluetooth controller is powered on
power_on() {
    if bluetoothctl show | grep -q "Powered: yes"; then
        return 0
    else
        return 1
    fi
}

if power_on; then
    mapfile -t paired_devices < <(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
    counter=0
    for device in "${paired_devices[@]}"; do
        if device_connected "$device"; then
            device_alias=$(bluetoothctl info "$device" | grep "Alias" | cut -d ' ' -f 2-)
            if [ $counter -gt 0 ]; then
                printf ", %s" "$device_alias"
            else
                printf " %s" "$device_alias"
            fi
            ((counter++))
        fi
    done
    printf "\n"
else
    echo "Off"
fi
