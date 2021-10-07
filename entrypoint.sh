#!/bin/bash

# git checkout tags/v5.11

# cp /boot/config-$(uname -r) .config
make oldconfig

# CONFIG_LOCALVERSION=$(uname -r | sed -E "s/([[:digit:]]+\.?){3}//g")
# echo "Detected CONFIG_LOCALVERSION \"$CONFIG_LOCALVERSION\""

# sed -i 's/^CONFIG_LOCALVERSION=.*$/CONFIG_LOCALVERSION=$CONFIG_LOCALVERSION/g' .config
make modules_prepare
cp /usr/src/linux-headers-5.11.0-37-generic/Module.symvers /home/kevin/code/linux/
make -j4 M=drivers/media/pci/tw686x modules

make M=drivers/media/pci/tw686x INSTALL_MOD_PATH=./rebuilt_tw686x modules_install

# sudo cp /home/kevin/code/linux/rebuilt_tw686x/lib/modules/5.15.0-rc4+/extra/tw686x.ko /lib/modules/`uname -r`/kernel/drivers/media/pci/tw686x/tw686x.ko

# ls -lah /home/kevin/code/linux/rebuilt_tw686x/lib/modules/5.11.0+/extra/tw686x.ko
# sudo cp /home/kevin/code/linux/rebuilt_tw686x/lib/modules/5.11.0+/extra/tw686x.ko /lib/modules/`uname -r`/kernel/drivers/media/pci/tw686x/tw686x.ko
# dmesg | grep tw686