#!/usr/bin/env bash

# signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > updates.signal.gpg
sudo install -o root -g root -m 644 updates.signal.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

sudo apt update
sudo apt install signal-desktop
