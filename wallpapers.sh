#!/usr/bin/env bash


### check if the distribution is compatible
if [[ $(lsb_release -cs) = "bookworm" ]]
then
	echo ""
	
else
	echo -e "\e[31;1mDistribution not approved for use with this script.\e[m"
	exit 1
fi

### check if there is an internet connection.
if ping -q -c 3 -W 1 1.1.1.1 >/dev/null;
then
  	echo ""
	
else
  	echo -e "\e[31;1mYou are not connected to the internet. Check your network or Wi-Fi connection before proceeding.\e[m"
	exit 1
fi

### Check for sudo privileges:


sudo -v || (inform "sudo may not be installed or the user may not have sudo permissions." && exit 1)


wget --version > /dev/null

if [[ $? -ne 0 ]]; then
        echo "wget not available , installing"
        sudo apt update && sudo apt install wget -y
fi

unzip >> /dev/null

if [[ $? -ne 0 ]]; then
        echo "unzip not available , installing"
        sudo apt update && sudo apt install unzip -y
fi




wget -O wallpapers.zip "https://github.com/phaleixo/debianForDevs/blob/main/wallpapers.zip"


if [[ $? -ne 0 ]]; then
        echo "Downloading failed , exiting"
        exit 1
fi

unzip wallpapers.zip -d ~/
sudo mv wallpapers /usr/share/backgrounds/



clear

echo "Done"
sleep 2
clear
echo "Set Wallpaper "

xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /usr/share/backgrounds/8.jpg

clear

rm -rf wallpapers.zip


echo -e "Wallpapers installed"

exit 0
