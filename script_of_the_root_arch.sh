#!/usr/bin/env bash
set -euo pipefail

PACKGZ=(
  bluez
  bluez-utils
  bluetui
  brigtnessctl
  btop
  clamav
  calibre
  dictd
  dolphin
  fastfetch
  gimp
  gvfs
  gfvs-mtp
  htop
  hyprland
  intel-ucode
  kitty
  kleopatra
  laptop-mode-tools
  lynis
  lutris
  man-db
  man-pages
  #mplayer
  #smplayer
  nano
  ncdu
  niri
  nicotine+
  okular
  pipewire
  pipewire-pulse
  pipewire-alsa
  plasma
  power-profiles-daemon
  #pwvucontrol
  helvum
  qbittorrent
  rofi
  sudo
  texinfo
  thermald
  ufw
  yt-dlp
  yazi
  rkhunter
  otf-opendyslexic-nerd
  ttf-nerd-fonts-symbols
  ttf-space-mono-nerd
  ttf-jetbrains-mono-nerd
)

sudo pacman -Syu ${PACKGZ[@]}

clear

echo "Setting Up Your Shit"

freshclam
systemctl enable ufw
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
systemctl start ufw
systemctl enable thermald
systemctl start thermald
systemctl enable power-profiles-daemon
systemctl start power-profiles-daemon
systemctl enable bluetooth.service
systemctl start bluetooth.service
systemctl start pipewire-pulse

sed -i 's/# %wheel ALL=(ALL:ALL) ALL/  %wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
clear

echo "Make a new user and run Nonroot Script"
echo "useradd -m -G wheel -s bash (username)"
