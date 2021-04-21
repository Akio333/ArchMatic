#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _    
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__ 
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "FINAL SETUP AND CONFIGURATION"

# ------------------------------------------------------------------------

echo
echo "Configuring MAKEPKG to use all 8 cores"

sudo sed -i -e 's|[#]*MAKEFLAGS=.*|MAKEFLAGS="-j$(nproc)"|g' makepkg.conf
sudo sed -i -e 's|[#]*COMPRESSXZ=.*|COMPRESSXZ=(xz -c -T 8 -z -)|g' makepkg.conf

# ------------------------------------------------------------------------

echo
echo "Disabling buggy cursor inheritance"

# When you boot with multiple monitors the cursor can look huge. This fixes it.
sudo cat <<EOF > /usr/share/icons/default/index.theme
[Icon Theme]
#Inherits=Theme
EOF

# ------------------------------------------------------------------------

echo
echo "Increasing file watcher count"

# This prevents a "too many files" error in Visual Studio Code
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system

# ------------------------------------------------------------------------

echo
echo "Enabling bluetooth daemon and setting it to auto-start"

sudo sed -i 's|#AutoEnable=false|AutoEnable=true|g' /etc/bluetooth/main.conf
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# ------------------------------------------------------------------------

echo
echo "Enabling the cups service daemon so we can print"

systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service

# ------------------------------------------------------------------------

echo
echo "Enabling Network Time Protocol so clock will be set via the network"

sudo ntpd -qg
sudo systemctl enable ntpd.service
sudo systemctl start ntpd.service

# -------------------------------------------------------------------------

echo ""
echo "Starting NetworkManager"
sudo systemctl disable dhcpcd.service
sudo systemctl stop dhcpcd.service
sudo systemctl enable --now NetworkManager.service

# -------------------------------------------------------------------------

echo
echo "Configuring Dotfiles and configs"

sudo echo "SATA_LINKPWR_ON_BAT=max_performance" >> /etc/tlp.conf
sudo tlp-start
sudo sed --in-place "s/#EnableAUR/EnableAUR/" "/etc/pamac.conf"
sudo sed --in-place "s/#CheckAURUpdates/CheckAURUpdates/" "/etc/pamac.conf"
usermod -aG adbusers
mkdir ~/.npm-packages

git clone https://github.com/Akio333/dotfiles.git ~/.config
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Linking stuff
rm -rf ~/.nano
ln -sf ~/.config/nano ~/.nano
ln -sf ~/.config/zshrc ~/.zshrc

echo "Done!"
echo 
echo "Reboot now..."
echo
