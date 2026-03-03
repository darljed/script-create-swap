#!/bin/bash

# 1. Create a 4GB swap file
sudo fallocate -l 4G /swapfile

# 2. Set correct permissions (root only)
sudo chmod 600 /swapfile

# 3. Format the file as swap space
sudo mkswap /swapfile

# 4. Activate the swap file immediately
sudo swapon /swapfile

# 5. Make swap permanent across reboots
# Check if entry already exists to avoid duplicates
if ! grep -q "/swapfile none swap sw 0 0" /etc/fstab; then
  echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
fi

# 6. Verify the swap is active
swapon --show
free -h
