#!/bin/bash

# Events on lid switching states(/proc/acpi/button/lid/LID/state), called by /etc/acpi/events/laptop-lid

sh -c "echo mem > /sys/power/state"
systemctl restart systemd-networkd && systemctl restart openvpn

# Dont forget make it executable
# To make changes take effect: sudo /etc/init.d/acpid restart
