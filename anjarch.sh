#!/usr/bin/emv sh
set -euo pipefail
clear
echo "Anjelo's Arch installation Script"
sleep 3s 
clear
read -p "Pick disk to install on (eg: /dev/sdx)" USER_DISK

#sfdisk $USER_DISK

clear
lsblk
read -p "name root partition (/dev/sdx)" ROOT_PART
mkfs.ext4 $ROOT_PART
read -p "name swap partition (/dev/sdx)" SWAP_PART
mkswap $SWAP_PART

mount $ROOT_PART /mnt
swapon $SWAP_PART
echo "cumpy cumpy"
#pacstrap -K 
