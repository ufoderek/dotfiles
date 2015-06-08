#!/bin/bash
pushd pub/a1840fhd_ww_gen1/flash_files/blankphone/a1840fhd_ww_gen1-blankphone
sudo fastboot oem unlock && \
sudo fastboot erase ESP && \
sudo fastboot oem start_partitioning && \
sudo fastboot flash gpt partition.tbl && \
sudo fastboot oem unlock && \
sudo fastboot format system && \
sudo fastboot format cache && \
sudo fastboot format config && \
sudo fastboot format logs && \
sudo fastboot oem stop_partitioning && \
sudo fastboot flash ESP esp.img && \
sudo fastboot flash fastboot droidboot.img && \
sudo fastboot erase keystore && \
sudo fastboot oem verified && \
sudo fastboot format data
popd
