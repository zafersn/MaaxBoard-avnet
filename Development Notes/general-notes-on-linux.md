* **To share yocto's source folders from anyother computer check this link out**
    
    https://pelux.io/2017/06/19/How-to-create-a-shared-sstate-dir.html

* **To mount all folders in your computer use this code below.**
```
sudo mount 192.168.100.144:/home/ubu/oe-sources /media/ubu/shared-oe-sources/
sudo mount 192.168.100.144:/home/ubu/imx-yocto-bsp/maaxboard/build/sstate-cache /media/ubu/shared-sstate-cache/
```
* **To unzip and burn yocto image to sd card**
``` 
bunzip2 lite-image-maaxboard-ddr4-2g-sdcard-20220209164551.rootfs.sdcard.bz2 -f
sudo dd if=lite-image-maaxboard-ddr4-2g-sdcard-20220209164551.rootfs.sdcard of=/dev/sd?? bs=10M conv=fsync
```
* **To build Loadable kernel module in yocto for maaxboard**

create symbolic link
```
ln -s /usr/src/kernel/ /lib/modules/4.14.78-1.0.0+g66620c3d281c/build
```

* **Fixing error: /bin/sh: scripts/basic/fixdep: No such file or directory**

for maaxboard/ yocto:
```
root@maaxboard-ddr4-2g-sdcard:/usr/src/kernel# make scripts
```
for debian/ubuntu
```
root@bpi:/usr/src/linux-headers-4.3.0-sunxi# make scripts
```

* **Putty serial connection line 80 character problem:**

when you connected target system, use this code on terminel screen
```
shopt -s checkwinsize;resize
```
https://unix.stackexchange.com/questions/317497/command-wraps-around-same-line-after-80-characters

* **To kill any procces:**
```
ps aux | grep toaster
kill -9 ------prcc number----
```

