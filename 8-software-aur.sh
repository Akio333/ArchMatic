#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _    
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__ 
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING AUR SOFTWARE"
echo

cd "${HOME}"

echo "CLOING: AURIC"
git clone "https://github.com/rickellis/AURIC.git"


PKGS=(

    # UTILITIES -----------------------------------------------------------

    'slimlock'                  # Screen locker

    # DEVELOPMENT ---------------------------------------------------------
    
    'visual-studio-code-bin'    # Kickass text editor

    # SOFTWARE MANAGER ----------------------------------------------------

    'pamac-aur'                 # Best software manager for archlinux

    # OFFICE --------------------------------------------------------------

    'freeoffice'

)


cd ${HOME}/AURIC
chmod +x auric.sh

for PKG in "${PKGS[@]}"; do
    ./auric.sh -i $PKG
done

echo
echo "Done!"
echo
