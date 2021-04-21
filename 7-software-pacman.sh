#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING SOFTWARE"
echo

PKGS=(

    # SYSTEM --------------------------------------------------------------

    'linux-lts'             # Long term support kernel

    # TERMINAL UTILITIES --------------------------------------------------

    'bash-completion'       # Tab completion for Bash
    'bc'                    # Precision calculator language
    'bleachbit'             # File deletion utility
    'curl'                  # Remote content retrieval
    'elinks'                # Terminal based web browser
    'feh'                   # Terminal-based image viewer/manipulator
    'file-roller'           # Archive utility
    'gnome-keyring'         # System password storage
    'gtop'                  # System monitoring via terminal
    'gufw'                  # Firewall manager
    'hardinfo'              # Hardware info app
    'htop'                  # Process viewer
    'inxi'                  # System information utility
    'jq'                    # JSON parsing library
    'jshon'                 # JSON parsing library
    'neofetch'              # Shows system info when you launch terminal
    'ntp'                   # Network Time Protocol to set time via network.
    'numlockx'              # Turns on numlock in X11
    'openssh'               # SSH connectivity tools
    'rsync'                 # Remote file sync utility
    'speedtest-cli'         # Internet speed via terminal
    'terminus-font'         # Font package with some bigger fonts for login terminal
    'tlp'                   # Advanced laptop power management
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'wget'                  # Remote content retrieval
    'xclip'                 # Clipboard Utility
    'kitty'                 # Terminal emulator
    'android-tools'         # adb and fastboot drivers
    'android-udev'          # udev rules for android devices
    'zenity'                # Display graphical dialog boxes via shell scripts
    'zip'                   # Zip compression program
    'zsh'                   # ZSH shell
    'zsh-completions'       # Tab completion for ZSH

    # DISK UTILITIES ------------------------------------------------------

    'autofs'                # Auto-mounter
    'exfat-utils'           # Mount exFat drives
    'gparted'               # Disk utility
    'gnome-disks'           # Disk utility
    'ntfs-3g'               # Open source implementation of NTFS file system
    'btrfs-progs'           # BtrFS support
    'grub-btrfs'            # btrfs snapshot booting support for grub
    'mtpfs'                 # mobile filesystem
    'gvfs-mtp'              # mtp backend android, media players
    'libmtp'                # mtp library

    # GENERAL UTILITIES ---------------------------------------------------

    'catfish'               # Filesystem search
    'conky'                 # System information viewer
    'nemo'                  # Filesystem browser
    'veracrypt'             # Disc encryption utility
    'variety'               # Wallpaper changer

    # DEVELOPMENT ---------------------------------------------------------

    'clang'                 # C Lang compiler
    'cmake'                 # Cross-platform open-source make system
    'git'                   # Version control system
    'gcc'                   # C/C++ compiler
    'glibc'                 # C libraries
    'meld'                  # File/directory comparison
    'nodejs'                # Javascript runtime environment
    'npm'                   # Node package manager
    'php'                   # Web application scripting language
    'postfix'               # SMTP mail server
    'python'                # Scripting language
    'yarn'                  # Dependency management (Hyper needs this)

    # WEB TOOLS -----------------------------------------------------------

    'chromium'              # Web browser
    'flashplugin'           # Flash

    # COMMUNICATIONS ------------------------------------------------------

    'telegram-desktop'      # Telegram

    # MEDIA ---------------------------------------------------------------

    'lollypop'              # Music player
    'simplescreenrecorder'  # Record your screen
    'vlc'                   # Video player
    'flameshot'             # Screenshot tool

    # GRAPHICS AND DESIGN -------------------------------------------------

    'gcolor2'               # Colorpicker
    'nomacs'                # Image viewer
    'pngcrush'              # Tools for optimizing PNG images
    'ristretto'             # Multi image viewer

    # PRODUCTIVITY --------------------------------------------------------

    'galculator'            # Gnome calculator
    'hunspell'              # Spellcheck libraries
    'hunspell-en'           # English spellcheck library
    'libreoffice-fresh'     # Libre office with extra features
    'mousepad'              # XFCE simple text editor
    'xpdf'                  # PDF viewer

    # VIRTUALIZATION ------------------------------------------------------

    'virtualbox'
    'virtualbox-host-modules-arch'

    # BACKUP AND RESTORE --------------------------------------------------
    'timeshift'             # Snapshotting tool
    'timeshift-autosnap'    # Automatic snapshot before system upgrade

    # UTILITIES -----------------------------------------------------------
    'tlp'                   # Laptop  Power tools
    'xfce4-power-manager'   # Power Manager

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
