#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
IFS=$'\n\t'

# Turn NetworkManager on
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager
sudo systemctl mask NetworkManager

# copy networks
sudo rm -f /etc/netplan/01-network-manager-all.yaml
sudo cp /etc/netplan/01-netplan.backup /etc/netplan/01-netplan.yaml

# turn systemd-network manager on
sudo systemctl unmask systemd-networkd.service
sudo systemctl enable systemd-networkd.service
sudo systemctl start systemd-networkd.service

sudo netplan apply
