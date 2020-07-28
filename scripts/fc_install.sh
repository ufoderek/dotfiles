sudo dnf install -y neovim git tmux mpv gnome-tweaks trash-cli ibus-rime \
exfat-utils fuse-exfat \
blivet-gui \
p7zip zip unzip unrar \
gimp calibre VirtualBox \
cjkuni-uming-fonts \
chromium-browser-privacy \
thunderbird-wayland nextcloud-client
#gnome-music vocal

#sudo dnf -y install ccid pcsc-tools # for EasyATM GT2

# adobe-source-han-sans-tw-fonts adobe-source-han-serif-tw-fonts
# dconf-editor
# pavucontrol
# HandBrake
# vlc

# sudo dnf install -y pcmanx-gtk2
# sudo dnf group install -y "C Development Tools and Libraries"
# sudo dnf groupupdate Multimedia -y --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate Multimedia

# Laptops
sudo dnf install -y tlp smartmontools
