cat >/tmp/fcitx.sh << EOL
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
EOL
sudo cp /tmp/fcitx.sh /etc/profile.d/
sudo chmod +x /etc/profile.d/fcitx.sh


cat >/tmp/kill-fcitx.service << EOL
[Unit]
Description=Kill fcitx
DefaultDependencies=no
Before=shutdown.target reboot.target halt.target

[Service]
Type=oneshot
ExecStart=/usr/bin/kill-fcitx

[Install]
WantedBy=halt.target reboot.target shutdown.target
EOL
sudo cp /tmp/kill-fcitx.service /lib/systemd/system/


cat >/tmp/kill-fcitx.sh << EOL
#!/bin/bash
killall fcitx
EOL
sudo cp /tmp/kill-fcitx.sh /usr/bin
sudo chmod +x /usr/bin/kill-fcitx.sh


sudo systemctl enable kill-fcitx.service
