#!/bin/sh
#
# Pack Tinycore , contents of folder TINYCORE will form the compressed
# tinycore file that will boot through GRUB 
#
#
#
#

TINYCOREFOLDER="TINYCORE"

 
BOOT_DRIVES=$(./hal_app2)
WORKING_DIR=/home/tc/
BOOT_DIR=/mnt/${BOOT_DRIVES}1/boot

mount_boot()
{
	echo $1
	[ -d /mnt/${BOOT_DRIVES}1 ] || mkdir /mnt/${BOOT_DRIVES}1
	[ -d /mnt/${BOOT_DRIVES}1/boot ] || mount /dev/${BOOT_DRIVES}1 /mnt/${BOOT_DRIVES}1 1>/dev/null 2>&1
	[ $? = 0 ] || error_stop "Try to mount /dev/${BOOT_DRIVES}1 failed."
}


umount_boot()
{
	umount /mnt/${BOOT_DRIVES}2 1>/dev/null 2>&1
}

mount_boot

echo "Creating Temporary folder"
mkdir -p  $WORKING_DIR/$TINYCOREFOLDER/home/tc
mkdir -p $WORKING_DIR/$TINYCOREFOLDER/tmp

echo "Removing local initrd folder, size is limited  ..."
rm -rf $WORKING_DIR/initrd


echo "Copying contents for temp FOLDER"
cp -rp /home/tc/* $WORKING_DIR/$TINYCOREFOLDER/home/tc
cp -rp /tmp/tce $WORKING_DIR/$TINYCOREFOLDER/tmp/
rm -rf $WORKING_DIR/$TINYCOREFOLDER/home/tc/$TINYCOREFOLDER


echo "Creating tinycore image with the contents of folder $TINYCOREFOLDER "


if [ ! -d "$WORKING_DIR/$TINYCOREFOLDER" ] ; then
	echo "Error: folder does not exist exiting" 
	exit 99
else


cd $WORKING_DIR/$TINYCOREFOLDER


echo "Changing file ownership for tinycore"
chown -R 1001:50 $WORKING_DIR/$TINYCOREFOLDER/home/tc
chown 1001:50 $WORKING_DIR/$TINYCOREFOLDER/tmp ; chown 3:1001 home


echo "Packing files"
find | cpio -o -H newc | gzip > ../tinycore.gz
	if [ -s ../tinycore.gz ] ; then
	echo "File ../tinycore.gz was created"
	ls -l ../tinycore.gz
	else
		echo "File was not created check for errors"
		echo "Place the file in your boot drives 1st partition e.g. sda1"
	fi
fi

echo "Copying file to your boot drive"


cp $WORKING_DIR/tinycore.gz /mnt/${BOOT_DRIVES}1/tinycore.gz

if [ -f /mnt/${BOOT_DRIVES}1/tinycore.gz ] ; then 

echo "Check file : "

ls -l /mnt/${BOOT_DRIVES}1/tinycore.gz
echo "Removing temp folders and files"
rm -rf $WORKING_DIR/$TINYCOREFOLDER
rm -rf $WORKING_DIR/tinycore.gz

else 

echo "----------============={ !!!! ATTENTION !!!! }============-------------"
echo "TINYCORE IS NOT THERE ! You might not be able to reboot into tinycore "
echo "----------============={ !!!! ATTENTION !!!! }============-------------"
rm -rf $WORKING_DIR/$TINYCOREFOLDER
echo "I will leave tinycore.gz in place for you to manually copy"

fi



echo "Unmounting boot drive "
umount_boot

echo "DONE ! "