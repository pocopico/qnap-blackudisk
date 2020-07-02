#!/bin/sh
#
# Refresh the contents of tinycore from github 
# 


 
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


refreshscripts()
{

echo "Loading required tce packages"

su - tc -c "tce-load -wi git"

 if [ ! -r /tmp/tcloop/git/usr/local/bin/git ] ; then

 echo "Done !!!" 
   else 
  echo "Couldnt download additional packages"
 exit 99
 fi
 
 echo "Cloning ...."
 git clone https://github.com/pocopico/qnap-blackudisk.git
 
 echo "Copying contents ..."
 cp $WORKING_DIR/qnap-blackudisk/home/tc/* /home/tc/
 cp $WORKING_DIR/qnap-blackudisk/tmp/tce/*  /tmp/tce/
 chown -R 1001:50 $WORKING_DIR/$TINYCOREFOLDER/home/tc
 chown 1001:50 $WORKING_DIR/$TINYCOREFOLDER/tmp ; chown 3:1001 home
 
 echo "Removing temp folder"
 rm -rf $WORKING_DIR/qnap-blackudisk
 
 echo "DONE !!! "

 echo "Check latest README.txt and or VERSION-X.XX files for more information"
 echo "If you need the changes to be permanent across reboots, then you might want to run packtinycore.sh script"
 
}



echo "This will refresh your scripts from github" 
read -p "Are you sure ? [Y] : " response
response=${response:-Y}

if [ $response = "Y" ] ; then 

refreshscripts

else 

echo "OK Wise choice :) "

fi

