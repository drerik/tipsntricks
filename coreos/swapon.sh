#!/bin/bash

swapfile=/swap

# verify that swap is not enabled, report back if it is...
curr_swap=$(free -o | grep ^Swap | tr -s " " | cut -d' ' -f 2)
if [[ ! curr_swap -eq 0 ]]; then
  echo "Current swap mem is set to $curr_swap. aborting!"
  exit 2
fi

# Get physical mem and devide by 2.. this is the size of the swap space we need to create.
size=$(expr $(free -o | grep ^Mem | tr -s " " | cut -d' ' -f 2) / 2)
echo "Setting swap mem size to $size kilobytes"

# check if there is a swap file and if not create it
if [[ ! -e $swapfile ]]; then
  echo "Swapfile does not exist, creating new one"
  sudo fallocate -l ${size}k /swap
  sudo /usr/sbin/mkswap /swap
  sudo chmod 0600 /swap
else
  echo "Using existing swap file"
fi

# enable it
sudo /usr/sbin/swapon /swap
free -h
