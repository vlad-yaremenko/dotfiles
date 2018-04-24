#!/usr/bin/env bash

echo "Update system..."
sudo apt-get update        # Fetches the list of available updates
sudo apt-get upgrade       # Strictly upgrades the current packages
sudo apt-get dist-upgrade  # Installs updates (new ones)

echo "Install system dependencies..."
sudo apt-get -y install \
  git \
  vim \
  vim-gnome \
  curl \
  ack-grep

echo "Install slack..."
sudo snap install -y slack --classic

echo "Install skype..."
sudo apt-get install -y apt-transport-https
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list
sudo apt-get update
sudo apt-get install -y skypeforlinux

echo "Install chrome..."
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable

echo "Done..."
