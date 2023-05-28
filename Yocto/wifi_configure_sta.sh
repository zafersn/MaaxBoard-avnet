#!/bin/bash
###### BEGINNING OF COMMENT
# these file paths for test cases, if you would like to test this sh file on your system, 
# you can use them instead of real wpa_sup...conf files 
# 
# WPA_FOLDER_PATH="/home/ubu/Desktop/test-files/wpa-supplicant"
# WPA_FILE_PATH_MAIN="/home/ubu/Desktop/test-files/wpa-supplicant.confaa"
# WPA_FILE_PATH_SUB="/home/ubu/Desktop/test-files/wpa-supplicant/wpa-supplicant-wlan0.confaa"
# WPA_RESOLVE_PATH="/home/ubu/Desktop/test-files/resolv.conf"
###### END 
WPA_FOLDER_PATH="/etc/wpa_supplicant" 
WPA_FILE_PATH_MAIN="/etc/wpa_supplicant.conf" 
WPA_FILE_PATH_SUB="/etc/wpa_supplicant/wpa_supplicant-wlan0.conf" 
WPA_RESOLVE_PATH="/etc/resolv.conf"

CONF_LINE_1="ctrl_interface=/var/run/wpa_supplicant"
CONF_LINE_2="ctrl_interface_group=0"
CONF_LINE_3="update_config=1"
CONF_LINE_4="network={"
#your wifi's ssid
CONF_LINE_5="ssid=\"79 Marlborough Mews\"" 
#your wifi's password
CONF_LINE_6="psk=\"letmein123\"" 
CONF_LINE_7="}"

wifi_settings_appened()
{
{	
	echo  $CONF_LINE_1
	echo  $CONF_LINE_2
	echo  $CONF_LINE_3
	echo  $CONF_LINE_4
	echo  $CONF_LINE_5
	echo  $CONF_LINE_6
	echo  $CONF_LINE_7
}>> $WPA_FILE_PATH_MAIN
}

printf "wifi configuration was started....  \n"
printf "folder: %s \nfile: %s \n\n" $WPA_FOLDER_PATH $WPA_FILE_PATH_MAIN


if  [ ! -d "$WPA_FOLDER_PATH" ]; then
	printf "%s folder was created! \n" $WPA_FOLDER_PATH
	mkdir  -p "$WPA_FOLDER_PATH"
else
	printf "%s folder exists! \n\n" $WPA_FOLDER_PATH
fi

if  [ ! -f "$WPA_FILE_PATH_MAIN" ]; then
	wifi_settings_appened
	printf "%s file was created! \n\n" $WPA_FILE_PATH_MAIN
else
	printf "%s file exists!\n\n" $WPA_FILE_PATH_MAIN
	lineNum=1
	while IFS="" read -r x || [ -n "$x" ]
	do
		firstchar=`echo "$x" | cut -c1-1`
		if [ ! $firstchar = "#" ]; then
			declare CONF_LINE_$lineNum
			var=CONF_LINE_$lineNum
		#	printf "|%s| ?== |%s| \n\n" "$x" "${!var}"
			if [ ! "$x" = "${!var}" ]; then
				rm $WPA_FILE_PATH_MAIN
				wifi_settings_appened
				printf "files does not match,old file $WPA_FILE_PATH_MAIN deleted and new $WPA_FILE_PATH_MAIN created! \n\n"
				break
			else 
				printf "%s's the [%d].line was matched \n" $WPA_FILE_PATH_MAIN $lineNum
			fi
			lineNum=$((lineNum+1))
		fi
	done < $WPA_FILE_PATH_MAIN
fi

while IFS="" read -r x || [ -n "$x" ]
do
                firstchar=`echo "$x" | cut -c1-1`
                if [ ! $firstchar = "#" ]; then
                        echo "$x"
                        if [ "$x | grep nameserver" = "" ]; then #if there is no nameserver
                                 echo "nameserver 192.168.100.1" >> $WPA_RESOLVE_PATH #write here your router's IP address
                        fi
                fi
done < $WPA_RESOLVE_PATH

printf "files are copying...\n"
cp "$WPA_FILE_PATH_MAIN" "$WPA_FILE_PATH_SUB"
printf "starting system service...\n"
systemctl start wpa_supplicant@wlan0 
printf "enabling system service...\n"
systemctl enable wpa_supplicant@wlan0
printf "wifi was succesfully configured...\n"

#ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || echo error

CONNECTED=$(ping -q -c1 google.com | grep '100% packet loss')
timeout=0
while [[ $CONNECTED != "" ]]; do
	echo -ne "waiting for the internet connection... $timeout sec\033[0K\r"
	sleep 1;
	if (( $timeout > 30 ));then
		printf "\nwe have not connected to the Wi-Fi! Please check wifi configuration details\n"
		break
	fi
	timeout=$((timeout+1))
done
if (( $timeout < 30 ));then
	printf "PC succesfully connected!\n"
	printf "Have a look at connection detail: \n"
	ifconfig wlan0
	ifconfig wlan0 | grep "inet addr:"
fi
exit 0

