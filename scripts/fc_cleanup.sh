sudo dnf erase simple-scan
sudo dnf erase evolution
# sudo dnf erase PackageKit
sudo dnf erase gnome-maps
sudo dnf erase gnome-user-docs
sudo dnf erase gnome-user-share
sudo dnf erase cheese 
# sudo dnf erase vlgothic-fonts

# List system services
# sudo systemctl -t service
# sudo systemctl disable libvirtd.service

# Show running user services.
# $ systemctl --user status
# Show all user units and their status.
# $ systemctl --user list-unit-files
systemctl --user mask evolution-addressbook-factory.service
systemctl --user mask evolution-calendar-factory.service
systemctl --user mask evolution-source-registry.service

systemctl --user stop tracker-store.service
rm -rf ~/.cache/tracker/
systemctl --user mask tracker-store.service
