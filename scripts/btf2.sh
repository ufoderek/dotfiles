#!/bin/bash
pushd out/target/product/ducati2fhd
sudo fastboot oem verified && \
sudo fastboot format cache && \
sudo fastboot flash esp_update esp.zip && \
sudo fastboot flash fastboot droidboot.img && \
sudo fastboot flash recovery recovery.img && \
sudo fastboot flash boot boot.img && \
sudo fastboot flash system system.img && \
sudo fastboot format cache && \
sudo fastboot format data && \
sudo fastboot reboot
#sudo fastboot update a1840fhd_ww_gen1-img-eng.ufoderek.zip && \
popd
