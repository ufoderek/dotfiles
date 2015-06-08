#!/bin/bash
pushd out/target/product/ducati2fhd
sudo fastboot flash osloader efilinux-userdebug.efi && \
sudo fastboot boot droidboot.img
popd
