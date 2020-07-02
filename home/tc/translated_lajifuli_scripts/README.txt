####################!!Self-reading file!!#####################

Added some practical script tools to improve the efficiency of the machine and save tossing time!
1. On the basis of Uncle Ji Fu's Year of the Dog gift package master, change the tiny system to manually open SSH mode to start with the system, the default SSH terminal account name tc, password 123456;
2. The original old uncle Jifu's create_qnap_boot is reserved, but renamed to orig_create_qnap_boot, if you need to use the original script, please pay attention to the script name change;
3. create_qnap_boot adds the rootfs2.bz format for repairing firmware 4.4.1.1000+ and above, and automatically clears the existing QNAP boot partition file command line on the basis of the original script of Uncle Jifu.
4. Added extract_orig_initrd script, which is convenient for tossing players to extract the initrd directory file of RAM DISK in the original firmware, find and collect the available files of drivers, model, patch and so on for each model;
5. Added repacking_boot script, which is convenient for players who have already made a guide, modify and fine-tune the initrd.boot file to avoid redoing the complete boot file every time, wasting time!

I wish you all peace and quiet in the year of the rat, more opportunities at home and less foundation outside! ----February 8, 2020----by Mojelly


#################Update-2020March6######################
1. Fix the "GRUB" problem of the BIOS legacy boot mode;
2. Repair Intel integrated display driver, now HD Station can be displayed and used normally;
3. Optimize the create_qnap_boot script, newly added to determine whether the offline firmware package exists in the same directory of the script, and the boot disk can be made offline without network download;
4. Optimize the create_qnap_boot script to automatically determine whether the firmware version needs to repair the rootfs2.bz file (from the experience of the forum god "r-MT")
5. Integrate the Intel I211 network card driver for the motherboard tiny system (from the driver patch and method of the Q group great god "Chun Xuan love")
6. Added DEV_BUS conversion generation script, used to generate model hardware information suitable for this machine (the code is derived from the hardware_check of the old uncle Uncle Fu)
#################Update-2020March6######################

Specific usage methods and other details can be found in the original post address http://www.nasyun.com/thread-68943-1-1.html

++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ++++++++++++++++++++++++++++
The Heiwei Unicom system tool disk is from the hands of NAS Cloud Forum, the great god Lao Jifu, and it was simply modified by the webmaster Mojelly.
Mainly used for individual users to study and learn Linux-related technical knowledge and technical exchanges based on QNAP QNAP NAS system.
No one may use this tool tray and its accessories for commercial purposes, such as legal problems and responsibilities arising therefrom,
The forum will actively cooperate with manufacturers to submit relevant evidence! The consequences shall be borne by the violators themselves!
If you have any objections, please do not use the tool tray and related accessories!
++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ++++++++++++++++++++++++++++


####################!!README!!######################
README in English, please use Google Translate yourself...