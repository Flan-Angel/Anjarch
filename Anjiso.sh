#!/usr/bin/env bash
set -euo pipefail
clear

echo "You need at least 2 partitions to continue. 1 root partition and one swap partition atleast half the size of your ram"

read -r -p "point to root partition. eg: /dev/sdx (replace x with your partion number)" ROOOT
read -r -p "point to swap partition. eg: /dev/sdx (replace x with your partion number)" SWAAP

swapon "$SWAAP"
mkfs.ext4 "$ROOOT"
mount "$ROOOT" /mnt
pacstrap -KP 

ANJACKAGES=[
  base
  base-devel
  linux-zen-headers
  linux-zen
  linux-firmware
  sof-firmware


]
