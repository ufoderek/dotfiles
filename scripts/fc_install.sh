sudo dnf install neovim git tmux mpv vlc gnome-tweaks trash-cli ibus-rime \
exfat-utils fuse-exfat \
blivet-gui \
p7zip zip unzip unrar \
gimp calibre VirtualBox \
cjkuni-uming-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-tw-fonts \
chromium-browser-privacy gnome-music vocal
# dconf-editor
# pavucontrol
# HandBrake

# sudo dnf install pcmanx-gtk2
sudo dnf group install "C Development Tools and Libraries"
# sudo dnf groupupdate Multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

# Laptops
sudo dnf install tlp smartmontools
