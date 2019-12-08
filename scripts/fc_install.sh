sudo dnf install vim neovim git tmux vlc gnome-tweaks trash-cli smartmontools \
exfat-utils fuse-exfat \
p7zip zip unzip unrar \
gimp calibre HandBrake google-chrome-stable \
cjkuni-uming-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-tw-fonts \
dconf-editor VirtualBox

# sudo dnf install pcmanx-gtk2
sudo dnf group install "C Development Tools and Libraries"
sudo dnf group install Multimedia


# Dropbox
# sudo dnf install nautilus-dropbox gnome-shell-extension-appindicator
# dropbox start # and follow the suggestion to fix /etc/sysctl.conf

# Laptops
# sudo dnf install tlp

# ibus-rime
sudo dnf install ibus-rime

# fcitx
# sudo dnf install fcitx fcitx-table fcitx-table-extra fcitx-configtool fcitx-chewing
