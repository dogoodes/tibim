#!/bin/bash

CERTDIR="/path/to/certs"

/usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 $CERTDIR/vboxdrv.priv $CERTDIR/vboxdrv.der $(modinfo -n vboxdrv)

/sbin/modprobe vboxdrv