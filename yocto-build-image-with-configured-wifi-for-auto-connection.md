# Build a yocto image with configured wifi/scripts for auto connection at boot

it might be difficult re-configuration of wifi every time, when building an image. To tackle this issue you can follow these few simple steps and build a pre-configured wifi image.
Let's start at the very beginning
briefly: what do we need to create a configured wifi image in Yocto
  1. Create .sh(wifi_configure_sta.sh) file to initialize and configure `/etc/wpa_supplicant.conf` file at booting the OS up 
  2. Edit initscripts.bb file to add our script to install it in after build
1. Creating script...  in ~/imx-yocto/sources/poky/meta/recipes-core/initscripts/initscripts-1.0 
  I created a basic wifi configuration sh file named wifi_configure_sta.sh to do it. check it out : 
  briefly: what are we doing in this script: 
  1. check wpa_supplicant folder in the /etc folder, if it does not exist create it. 
  2. check wpa_supplicant.conf file in the /etc folder, if it does not exist create it. if it exists, check every single line whether or not it was configured properly.
      if it is not, rewrite the file.
  3. check resolv.conf file in the /etc folder, if it is not configured, add a nameserver line like a `nameserver 192.168.100.1`
      ```
      echo "nameserver 192.168.100.1" >> /etc/resolv.conf
      ```
  4. copy /etc/wpa_supplicant.conf to /etc/wpa_supplicant folder which was created at the 1.step named as wpa_supplicant-wlan0.conf
      ```
      cp "/etc/wpa_supplicant.conf" "/etc/wpa_supplicant/wpa_supplicant-wlan0.conf"
      ```
  5. Start and enable system services by these codes below: 
     ```
      printf "starting system service...\n"
      systemctl start wpa_supplicant@wlan0 
      printf "enabling system service...\n"
      systemctl enable wpa_supplicant@wlan0
    ```
  6. Check whether or not the configuration is a success
      ```
      ping -q -c1 google.com 
      ```
2. Edit initscripts_1.0.bb in ~/imx-yocto/sources/poky/meta/recipes-core/initscripts/
   Add these keywords into the code block that I mentioned below
   1. .sh file name into SRC_URI code block
      ```
      SRC_URI = " \
      file://wifi_configure_sta.sh \
      "
      ```
   2.  Create directories and runlevel links, install device-independent scripts 
      ```
      do_install () {
        # Create directories and install device independent scripts
        install -m 0755    ${WORKDIR}/wifi_configure_sta.sh     ${D}${sysconfdir}/init.d
      .
      .  
       # Create runlevel links
        update-rc.d -r ${D} wifi_configure_sta.sh start 99 2 3 4 5 .
      }
      ```
   3. mask the script
      ```
      MASKED_SCRIPTS = " \
      wifi_configure_sta \
      "
      ```
   4. Last but not least, we need to add the "bash" keyword to it because our sh file is a bash script file.
      ```
       RDEPENDS_${PN} = " \
       bash \
		   "
      ```
  That's all.
