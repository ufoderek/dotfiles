sudo dnf install vim neovim git tmux vlc gnome-tweaks trash-cli smartmontools \
exfat-utils fuse-exfat \
p7zip zip unzip unrar \
gimp calibre HandBrake google-chrome-stable gnome-music VirtualBox \
cjkuni-uming-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-tw-fonts \
dconf-editor
# pavucontrol

# sudo dnf install pcmanx-gtk2
sudo dnf group install "C Development Tools and Libraries"
sudo dnf group install Multimedia


# Dropbox
# sudo dnf install nautilus-dropbox gnome-shell-extension-appindicator
# dropbox start # and follow the suggestion to fix /etc/sysctl.conf
# echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p

# Laptops
# sudo dnf install tlp

# ibus-rime
sudo dnf install ibus-rime

# fcitx
# sudo dnf install fcitx fcitx-table fcitx-table-extra fcitx-configtool fcitx-chewing

# SSD trim for FC31
# sudo systemctl enable fstrim.timer
