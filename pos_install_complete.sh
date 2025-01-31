#!/usr/bin/env bash


### Initial message
echo -e "\n     ############################################################"
echo -e "       #      Activate the contrib and non-free repository  /     #"
echo -e "       #     Install flatpak support and flathub repository /     #"
echo -e "       #          Change Firefox ESR to Firefox Current /         #"
echo -e "       #               Install codecs and tweaks /                #"
echo -e "       #                Install and set Fonts /                   #"
echo -e "       #              Install and set Wallpapers /                #"
echo -e "       #                    Install Apps /                        #"
echo -e "       #              Unnecessary Apps Remover /                  #"
echo -e "       #               Switch Radeon to Amdgpu /                  #"
echo -e "       ############################################################ \n"
echo "For more information, visit the project link:"
echo "https://github.com/phaleixo/debianForDevs"

### Confirm script execution
read -p "Do you want to proceed? (y/n): " response
[[ "$response" != "y" ]] && inform "Operation canceled by the user." && exit 0

### check if the distribution is compatible
if [[ $(lsb_release -cs) = "bookworm" ]]
then
	echo ""
	echo ""
	echo -e "\e[32;1mDebian 12 Distribution.\e[m"
	echo "Continuing with the script..."
	echo ""
else
	echo -e "\e[31;1mDistribution not approved for use with this script.\e[m"
	exit 1
fi

### check if there is an internet connection.
if ping -q -c 3 -W 1 1.1.1.1 >/dev/null;
then
  	echo ""
	echo ""
	echo -e "\e[32;1mInternet connection OK.\e[m"
	echo "Continuing with the script..."
	echo ""
else
  	echo -e "\e[31;1mYou are not connected to the internet. Check your network or Wi-Fi connection before proceeding.\e[m"
	exit 1
fi

### Check for sudo privileges

sudo -v || (inform "sudo may not be installed or the user may not have sudo permissions." && exit 1)


### Activating the contrib and non-free repository and install flatpak support and flathub repository:

curl -o activating_repo_apps.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/activating_repo_apps.sh && chmod +x activating_repo_apps.sh && ./activating_repo_apps.sh && rm activating_repo_apps.sh


### Change Firefox ESR to Firefox Current

curl -o change_firefox_esr_to_firefox.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/change_firefox_esr_to_firefox.sh && chmod +x change_firefox_esr_to_firefox.sh && ./change_firefox_esr_to_firefox.sh && rm change_firefox_esr_to_firefox.sh


### Install codecs and tweaks.

curl -o codecs_and_tweaks_installer.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/codecs_and_tweaks_installer.sh && chmod +x codecs_and_tweaks_installer.sh && ./codecs_and_tweaks_installer.sh && rm codecs_and_tweaks_installer.sh


### Install and set Fonts.

curl -o fonts.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/fonts.sh && chmod +x fonts.sh && ./fonts.sh && rm fonts.sh


### Install and set Wallpapers:

curl -o wallpapers.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/wallpapers.sh && chmod +x wallpapers.sh && ./wallpapers.sh && rm wallpapers.sh


### Install Apps:

curl -o install_apps.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/install_apps.sh && chmod +x install_apps.sh && ./install_apps.sh && rm install_apps.sh


### Unnecessary Apps Remover:

curl -o unnecessary_apps_remover.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/unnecessary_apps_remover.sh && chmod +x unnecessary_apps_remover.sh && ./unnecessary_apps_remover.sh && rm unnecessary_apps_remover.sh

### Change Xfce Panel:

curl -o xfce_panel_tweaks.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/xfce_panel_tweaks.sh && chmod +x xfce_panel_tweaks.sh && ./xfce_panel_tweaks.sh && rm xfce_panel_tweaks.sh

### Change Theme:

curl -o theme.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/theme.sh && chmod +x theme.sh && ./theme.sh && rm theme.sh

### Switch Radeon to Amdgpu:

curl -o radeon_to_amdgpu.sh https://raw.githubusercontent.com/phaleixo/debianForDevs/main/radeon_to_amdgpu.sh && chmod +x radeon_to_amdgpu.sh && ./radeon_to_amdgpu.sh && rm radeon_to_amdgpu.sh


exit 0

