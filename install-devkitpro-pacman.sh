#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

echo "Adding devkitPro apt repository..."

# Download and add the devkitPro GPG key
mkdir -p /etc/apt/keyrings
curl -sL https://apt.devkitpro.org/devkitpro-pub.gpg | tee /etc/apt/keyrings/devkitpro-archive-keyring.gpg > /dev/null

# Add the repository to sources.list.d
echo "deb [signed-by=/etc/apt/keyrings/devkitpro-archive-keyring.gpg] https://apt.devkitpro.org/ /" | tee /etc/apt/sources.list.d/devkitpro.list > /dev/null

echo "Updating package lists..."
apt-get update

echo "Installing devkitpro-pacman..."
apt-get install -y devkitpro-pacman

echo "Installation complete!"
echo "You can now use 'dkp-pacman' to install devkitPro packages."
