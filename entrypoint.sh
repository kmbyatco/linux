#!/bin/bash

cp /boot/config-$(uname -r) .config
make oldconfig

CONFIG_LOCALVERSION=$(uname -r | sed -E "s/([[:digit:]]+\.?){3}//g")
echo "Detected CONFIG_LOCALVERSION \"$CONFIG_LOCALVERSION\""    

sed -i 's/^CONFIG_LOCALVERSION=.*$/CONFIG_LOCALVERSION=$CONFIG_LOCALVERSION' .config
make modules_prepare
make -j4 M=drivers/tw686x rebuilt_tw686x