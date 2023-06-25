#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
IFS=$'\n\t'

# turn systemd-network manager off
sudo systemctl disable systemd-networkd.service
sudo systemctl mask systemd-networkd.service
sudo systemctl stop systemd-networkd.service

# copy networks
sudo rm -f /etc/netplan/01-netplan.yaml
sudo cp /etc/netplan/01-network-manager-all.backup /etc/netplan/01-network-manager-all.yaml

# Turn NetworkManager on
sudo systemctl unmask NetworkManager
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

sudo reboot
