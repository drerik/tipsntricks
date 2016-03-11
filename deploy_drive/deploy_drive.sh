#!/bin/bash

DEVICE=$1
MOUNT_PATH=$2

syntax()
{
	echo "Syntax: $0 <device> <mount path>"
	echo "Example: $0 /dev/vdc /var/lib/docker"
}

if [[ "x$DEVICE" == "x"  ]]
then
	echo "No device specified, aborting..."
	syntax
	exit 1
fi


if [[ "x$MOUNT_PATH" == "x"  ]]
then
	echo "No mount path specified, aborting..."
	syntax
	exit 1
fi

echo "Partitioning $DEVICE"
sfdisk $DEVICE -uM << EOF
,
;
EOF

echo "Making ext4 filesystem"
mkfs.ext4 -j $DEVICE"1"

echo "Adding nes $MOUNT_PATH to fstab"
echo $DEVICE"1               $MOUNT_PATH    ext4     defaults        0 0" >> /etc/fstab

echo "Migrating from old to new $MOUNT_PATH"
mv $MOUNT_PATH $MOUNT_PATH.old
mkdir $MOUNT_PATH
mount $MOUNT_PATH
mv $MOUNT_PATH.old/* $MOUNT_PATH/.
