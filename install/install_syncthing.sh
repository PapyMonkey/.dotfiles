#!/usr/bin/env bash

# syncthing
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
sudo apt update
sudo apt install -y syncthing

sudo systemctl enable syncthing@username.service
sudo systemctl start syncthing@username.service
