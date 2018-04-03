#!/usr/bin/env bash

# Update dotfiles
echo "Update dotfiles..."
git pull origin master;

echo "Update system..."
sudo apt-get update        # Fetches the list of available updates
sudo apt-get upgrade       # Strictly upgrades the current packages
sudo apt-get dist-upgrade  # Installs updates (new ones)

echo "Install system dependencies..."
sudo apt install \
  git \
  vim \
  vim-gnome \
  curl \
  ack-grep
