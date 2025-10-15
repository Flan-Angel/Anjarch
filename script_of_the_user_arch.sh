#!/usr/bin/env bash
set -euo pipefail

clear
echo "Installing Extras"
sudo pacman -S --noconfirm npm
NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
sudo ln -s ~/.joplin-bin/bin/joplin /usr/local/bin/joplin

sudo pacman -S --needed --noconfirm base-devel git
sudo git clone https://aur.archlinux.org/yay.git
cd yay
sudo makepkg -si
yay --version

mkdir ~/.config/hypr
cp ~/Anjarch/hyprland.conf ~/.config/hypr

echo "Thank you for using my utility :)"
read -p "Run a system wide virus scan? This will take a bit (y/N)" bscan

if [[ $bscan == y ]]; then
  sudo freshclam
  sudo clamscan -l -r ~/Clamscan_Log.log
  clear
  sudo cat ~/Clamscan_Log.log | grep FOUND

fi

clear

echo "Goodbye User :) please rate my github repo"
