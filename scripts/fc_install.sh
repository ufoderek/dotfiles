sudo dnf install -y neovim git tmux mpv trash-cli \
ibus-rime sqlite \
gnome-tweaks gnome-extensions-app \
exfat-utils fuse-exfat \
blivet-gui \
p7zip zip unzip unrar \
calibre gimp gimp-heif-plugin libheif libheif-freeworld heif-pixbuf-loader \
chromium-freeworld \
ghostwriter \
VirtualBox \
printer-driver-brlaser \
thunderbird-wayland nextcloud-client

sudo dnf group install -y "C Development Tools and Libraries"

#sudo dnf -y tlp

#sudo dnf -y install ccid pcsc-tools # for EasyATM GT2

#sudo dnf -y install adobe-source-han-sans-tw-fonts adobe-source-han-serif-tw-fonts
