sudo dnf erase simple-scan evolution gnome-maps gnome-user-docs gnome-user-share cheese

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
