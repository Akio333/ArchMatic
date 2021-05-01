#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _    
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__ 
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING OPENBOX"
echo

PKGS=(
        'openbox'                 # Openbox WM
        'ttf-dejavu'              # DejaVu Font
        'ttf-liberation'          # Liberation font
        'obconf'                  # Configuration tool
        'lxappearance'            # gtx theme changing app
        'lxappearance-obconf'     # openbox plugin for lxappearance
        'tint2'                   # Panel
        'qt5ct'                   # Qt theme changing app
        'menumaker'               # Dynamic menu creater
        'rofi'                    # Rofi launcher
        'lightdm'                 # Display Manager
        'lightdm-gtk-greeter'     # greeter for lightdm
        'picom'                   # Compositor
        'nitrogen'                # Walpaper setter
        'variety'                 # Changing wallpapers periodically
        'gnome-keyring'           # gnome keyring
        'polkit-gnome'            # gnome ploicy kit agent
        'arc-gtk-theme'           # GTK theme
        'papirus-icon-theme'      # Papirus Icon theme
        'breeze'                  # QT theme
        'font-manager'            # Simple font management app
        'xterm'                   # Fallback terminal
        'xorg-xbacklight'         # Backlight control
        'plank'                   # Dock
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
