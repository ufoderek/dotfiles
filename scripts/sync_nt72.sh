#!/bin/bash

KERNEL_PATH=~/wk/linux-3.10/drivers/mtd/nand/nt72_nand
FSR_PATH=~/wk/171/VDLinux_3.0.20/linux-3.0.20/drivers/fsr/LLD/PND_NT171
TFSR_PATH=~/wk/171/VDLinux_3.0.20/linux-3.0.20/drivers/tfsr/LLD/PND_NT171
CVT_PATH=~/wk/nvt-sample_v2.0/drivers/nand
B0_PATH=~/wk/171/onboot/bootram/nt72_nand
B1_PATH=~/wk/171/onboot/fsr/LLD/PND_NT171

if [ "$1" = "k" ]; then
	SRC=$KERNEL_PATH
elif [ "$1" = "c" ]; then
	SRC=$CVT_PATH
elif [ "$1" = "b0" ]; then
	SRC=$B0_PATH
elif [ "$1" = "b1" ]; then
	SRC=$B1_PATH
elif [ "$1" = "fsr" ]; then
	SRC=$FSR_PATH
elif [ "$1" = "tfsr" ]; then
	SRC=$TFSR_PATH
fi

if [ "$2" = "k" ]; then
	TARGET=$KERNEL_PATH
elif [ "$2" = "c" ]; then
	TARGET=$CVT_PATH
elif [ "$2" = "b0" ]; then
	TARGET=$B0_PATH
elif [ "$2" = "b1" ]; then
	TARGET=$B1_PATH
elif [ "$2" = "fsr" ]; then
	TARGET=$FSR_PATH
elif [ "$2" = "tfsr" ]; then
	TARGET=$TFSR_PATH
fi

cp -f $SRC/nt72_nand*.c $TARGET/
cp -f $SRC/FSR_LLD_NVT_NFC.c $TARGET/
cp -f $SRC/FSR_LLD_NVT_NFC.h $TARGET/
cp -f $SRC/include/*.h $TARGET/include/
