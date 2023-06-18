#!/bin/bash

# Events on lid switching states(/proc/acpi/button/lid/LID/state), called by /etc/acpi/events/laptop-lid

cat /proc/acpi/button/lid/LID/state | grep closed -q
if [[ $? -eq 0 ]]; then
        while grep -q closed /proc/acpi/button/lid/LID/state
        do
                sh -c "echo mem > /sys/power/state"
        done
        systemctl restart systemd-networkd && systemctl restart openvpn
fi

# Dont forget make it executable
# To make changes take effect: sudo /etc/init.d/acpid restart
