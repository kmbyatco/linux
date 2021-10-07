#!/bin/bash

# sudo /bin/bash -c 'echo "1" > /sys/devices/pci0000:00/0000:00:1c.4/0000:02:00.0/remove'
# sudo modprobe -r tw686x
# sudo cp /lib/modules/`uname -r`/kernel/drivers/media/pci/tw686x/tw686x.ko{,.bak}
# sudo ls /lib/modules/`uname -r`/kernel/drivers/media/pci/tw686x/tw686x.ko.bak


sudo cp /home/kevin/code/linux/built-drivers/lib/modules/5.15.0-rc4/extra/tw686x.ko /lib/modules/`uname -r`/kernel/drivers/media/pci/tw686x/tw686x.ko
sudo chmod 644 /lib/modules/`uname -r`/kernel/drivers/media/pci/tw686x/tw686x.ko
sudo depmod -ae