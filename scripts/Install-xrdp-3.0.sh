#!/bin/bash
#####################################################################################################
# Script_Name : install-xrdp-3.0.sh
# Description : Perform a custom installation of xrdp
# on ubuntu 18.04 and later
# Date : May 2019
# written by : Griffon
# Web Site :http://www.c-nergy.be - http://www.c-nergy.be/blog
# Version : 3.0
# History : 3.0 - Added support for Ubuntu 19.04 
#               - New code for Look'n feel using xsessionrc method
#               - New code for enabling Sound Redirection - compiling from source 
#               - Removed -g parameter   
#         : 2.4 - Proper fix for U18.04.2 when xserver-xorg-core-hwe-18.04
#                 changed code to detect whicht package in use and perform most appropriate compilation   
#         : 2.3 - Quick Fix Ubuntu 18.04.2 issue when xserver-xorg-core-hwe-18.04 installed
#         : 2.2 - Add Support for Ubuntu 18.10 and Yaru Theme
#         : 2.1 - Add logic to enable sound redirection for U18.04
#               - re-write code logic to include functions
#               - Removed support for Ubuntu 17.10 as reached end of support
#         : 2.0 - Initial Version for Ubuntu system with Gnome Desktop
#         : 1.x - Script for Ubuntu 16.04 or later       
# Disclaimer : Script provided AS IS. Use it at your own risk....
####################################################################################################

#---------------------------------------------------#
#  Detecting if Parameters passed to script .... 
#---------------------------------------------------#

while getopts s: option 
do 
 case "${option}" 
 in 
 s) fixSound=${OPTARG};; 
 esac 
done 

#---------------------------------------------------#
# Script Version information Displayed              #
#---------------------------------------------------#

echo
/bin/echo -e "\e[1;36m   !-------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m   !   Custom XRDP Installation Script  - Ver 3.0                !\e[0m"
/bin/echo -e "\e[1;36m   !   Written by Griffon - May 2019 - www.c-nergy.be            !\e[0m"
/bin/echo -e "\e[1;36m   !-------------------------------------------------------------!\e[0m"
echo

#--------------------------------------------------------------------------#
# -----------------------Function Section - DO NOT MODIFY -----------------#
#--------------------------------------------------------------------------#

#---------------------------------------------------#
# Function 1 - Install Prereqs...
#---------------------------------------------------#

install_prereqs() {

echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Installing PreReqs packages..Proceeding.  ! \e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo
/bin/echo -e "\e[1;33m   |-| Detecting xserver-xorg-core package installed  \e[0m"

xorgver=$(dpkg-query -W -f ='${Status}\n' xserver-xorg-core | awk {'print $3'}) 

if [[ "$xorgver" = *not-installed* ]];  
then
# - hwe 18.04 is installed
/bin/echo -e "\e[1;32m       |-| xorg package version: xserver-xorg-core-hwe-18.04 \e[0m"
echo
sudo apt-get -y install libx11-dev libxfixes-dev libssl-dev libpam0g-dev libtool libjpeg-dev flex bison gettext autoconf libxml-parser-perl libfuse-dev xsltproc libxrandr-dev python-libxml2 nasm xserver-xorg-dev-hwe-18.04 fuse pkg-config git intltool xserver-xorg-core-hwe-18.04
else
# - hwe 18.04 not installed
/bin/echo -e "\e[1;32m       |-| xorg package version: xserver-xorg-core \e[0m"
echo
sudo apt-get -y install libx11-dev libxfixes-dev libssl-dev libpam0g-dev libtool libjpeg-dev flex bison gettext autoconf libxml-parser-perl libfuse-dev xsltproc libxrandr-dev python-libxml2 nasm xserver-xorg-dev fuse pkg-config git intltool xserver-xorg-core
fi

}

#---------------------------------------------------#
# Function 2 - Download XRDP Binaries... 
#---------------------------------------------------#
get_binaries() { 

echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Download xRDP Binaries.......Proceeding.  ! \e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo

cd ~/Downloads

## -- Download the xrdp latest files
echo
/bin/echo -e "\e[1;32m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;32m   !  Preparing download xrdp package            !\e[0m"
/bin/echo -e "\e[1;32m   !---------------------------------------------!\e[0m"
echo
git clone https://github.com/neutrinolabs/xrdp.git
echo
/bin/echo -e "\e[1;32m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;32m   !  Preparing download xorgxrdp package        !\e[0m"
/bin/echo -e "\e[1;32m   !---------------------------------------------!\e[0m"
echo
git clone https://github.com/neutrinolabs/xorgxrdp.git

}

#---------------------------------------------------#
# Function 3 - compiling xrdp... 
#---------------------------------------------------#

compile_source() { 

# -- Compiling xrdp package first 

echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Compile xRDP packages .......Proceeding.  ! \e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo

cd ~/Downloads/xrdp
sudo ./bootstrap
sudo ./configure --enable-fuse --enable-jpeg --enable-rfxcodec
sudo make

#-- check if no error during compilation 

if [ $? -eq 0 ]
then 
/bin/echo -e "\e[1;33m   |-| Make Operation Completed successfully       \e[0m"

else 
echo
echo
/bin/echo -e "\e[1;31m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;31m   !   Error while Executing make                !\e[0m"
/bin/echo -e "\e[1;31m   !   The Script is exiting....                 !\e[0m"
/bin/echo -e "\e[1;31m   !---------------------------------------------!\e[0m"
exit
fi
sudo make install

echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Compile xorgxrdp packages....Proceeding.  ! \e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo

cd ~/Downloads/xorgxrdp 
sudo ./bootstrap 
sudo ./configure 
sudo make

# check if no error during compilation 
if [ $? -eq 0 ]
then 
echo
/bin/echo -e "\e[1;33m   |-| Make Operation Completed successfully       \e[0m"
echo
else 
echo
/bin/echo -e "\e[1;31m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;31m   !   Error while Executing make                !\e[0m"
/bin/echo -e "\e[1;31m   !   The Script is exiting....                 !\e[0m"
/bin/echo -e "\e[1;31m   !---------------------------------------------!\e[0m"
exit
fi
sudo make install

}

#---------------------------------------------------#
# Function 5 - create services .... 
#---------------------------------------------------# 

enable_service() {
echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Creating xRDP services.......Proceeding.  ! \e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo

sudo systemctl daemon-reload
sudo systemctl enable xrdp.service
sudo systemctl enable xrdp-sesman.service
sudo systemctl start xrdp

}

#---------------------------------------------------#
# Function 6 - Install Gnome Tweak Tool.... 
#---------------------------------------------------#

install_tweak() 
{
echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Installing Gnome Tweak...Proceeding...    ! \e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo
sudo apt-get install gnome-tweak-tool -y
}

#--------------------------------------------------------------------#
# Fucntion 7 - Allow console Access ....
#--------------------------------------------------------------------#

allow_console() 
{
echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Granting Console Access...Proceeding...   ! \e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo
sudo sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config
}

#---------------------------------------------------#
# Function 8 - create policies exceptions .... 
#---------------------------------------------------#

create_polkit()
{
echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Creating Polkit File...Proceeding...      ! \e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo

sudo bash -c "cat >/etc/polkit-1/localauthority/50-local.d/45-allow.colord.pkla" <<EOF
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes

[Allow Package Management all Users]
Identity=unix-user:*
Action=org.debian.apt.*;io.snapcraft.*;org.freedesktop.packagekit.*;com.ubuntu.update-notifier.*
ResultAny=no
ResultInactive=no
ResultActive=yes
EOF

}

#---------------------------------------------------#
# Function 9 - Fixing Theme and Extensions .... 
#---------------------------------------------------#

fix_theme()
{
echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Fix Theme and extensions...Proceeding...  !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo
sudo sed -i.bak "4 a #Improved Look n Feel Method\ncat <<EOF > ~/.xsessionrc\nexport GNOME_SHELL_SESSION_MODE=ubuntu\nexport XDG_CURRENT_DESKTOP=ubuntu:GNOME\nexport XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg\nEOF\n" /etc/xrdp/startwm.sh
echo
}

#---------------------------------------------------#
# Function 10 - Enable Sound Redirection .... 
#---------------------------------------------------#

enable_sound()
{
echo
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Enabling Sound Redirection...             !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo

# Step 1 - Enable Source Code Repository
sudo apt-add-repository -s 'deb http://be.archive.ubuntu.com/ubuntu/ '$codename' main restricted'
sudo apt-add-repository -s 'deb http://be.archive.ubuntu.com/ubuntu/ '$codename' restricted universe main multiverse'
sudo apt-add-repository -s 'deb http://be.archive.ubuntu.com/ubuntu/ '$codename'-updates restricted universe main multiverse'
sudo apt-add-repository -s 'deb http://be.archive.ubuntu.com/ubuntu/ '$codename'-backports main restricted universe multiverse'
sudo apt-add-repository -s 'deb http://be.archive.ubuntu.com/ubuntu/ '$codename'-security main restricted universe main multiverse'
sudo apt-get update

# Step 2 - Install Some PreReqs
sudo apt-get install git libpulse-dev autoconf m4 intltool build-essential dpkg-dev -y
sudo apt build-dep pulseaudio -y

# Step 3 -  Download pulseaudio source in /tmp directory - Do not forget to enable source repositories
cd /tmp
sudo apt source pulseaudio

# Step 4 - Compile
pulsever=$(pulseaudio --version | awk '{print $2}')
cd /tmp/pulseaudio-$pulsever
sudo ./configure

# step 5 - Create xrdp sound modules
sudo git clone https://github.com/neutrinolabs/pulseaudio-module-xrdp.git
cd pulseaudio-module-xrdp
sudo ./bootstrap 
sudo ./configure PULSE_DIR="/tmp/pulseaudio-$pulsever"
sudo make

#Step 6 copy files to correct location (as defined in /etc/xrdp/pulse/default.pa)
cd /tmp/pulseaudio-$pulsever/pulseaudio-module-xrdp/src/.libs
sudo install -t "/var/lib/xrdp-pulseaudio-installer" -D -m 644 *.so
sudo install -t "/usr/lib/pulse-$pulsever/modules" -D -m 644 *.so
echo

}

#--------------------------------------------------------------------------#
# -----------------------END Function Section             -----------------#
#--------------------------------------------------------------------------#

#--------------------------------------------------------------------------#
#------------                 MAIN SCRIPT SECTION       -------------------#  
#--------------------------------------------------------------------------#



#---------------------------------------------------#
# Step 0 - Try to Detect Ubuntu Version.... 
#---------------------------------------------------#

version=$(lsb_release -sd) 
codename=$(lsb_release -sc) 

echo
/bin/echo -e "\e[1;33m   |-| Detecting Ubuntu version        \e[0m"

if  [[ "$version" = *"Ubuntu 18.04"* ]];
then
/bin/echo -e "\e[1;32m       |-| Ubuntu Version : $version\e[0m"
echo
elif [[ "$version" = *"Ubuntu 18.10"* ]];
then
/bin/echo -e "\e[1;32m       |-| Ubuntu Version : $version\e[0m"
echo
elif [[ "$version" = *"Ubuntu 19.04"* ]];
then
/bin/echo -e "\e[1;32m       |-| Ubuntu Version : $version\e[0m"
echo
else
/bin/echo -e "\e[1;31m  !------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;31m  ! Your system is not running Ubuntu 18.04 Edition and later  !\e[0m"
/bin/echo -e "\e[1;31m  ! The script has been tested only on Ubuntu 18.04 and later  !\e[0m"
/bin/echo -e "\e[1;31m  ! The script is exiting...                                   !\e[0m"              
/bin/echo -e "\e[1;31m  !------------------------------------------------------------!\e[0m"
echo
exit
fi

/bin/echo -e "\e[1;33m   |-| Detecting Parameters        \e[0m"

#Detect if argument passed
if [ "$fixSound" = "yes" ]; 
then 
/bin/echo -e "\e[1;32m       |-| Sound Redirection Option...: [YES]\e[0m"
else
/bin/echo -e "\e[1;32m       |-| Sound Redirection Option...: [NO]\e[0m"
fi

#---------------------------------------------------------#
# Step 1 - Executing the installation & config tasks .... #
#---------------------------------------------------------#

echo
/bin/echo -e "\e[1;36m   !-------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m   !   Installation Process starting....                         !\e[0m"
/bin/echo -e "\e[1;36m   !-------------------------------------------------------------!\e[0m"
echo
/bin/echo -e "\e[1;33m   |-| Proceed with installation.....       \e[0m"
echo 

install_prereqs
get_binaries
compile_source
enable_service
install_tweak
allow_console
create_polkit
fix_theme


if [ "$fixSound" = "yes" ]; 
then 
enable_sound
fi

#---------------------------------------------------#
# Step 2 - Credits .... 
#---------------------------------------------------#
echo
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! Installation Completed                                                !\e[0m"
/bin/echo -e "\e[1;36m ! Please test your xRDP configuration.A Reboot Might be required...     !\e[0m"
/bin/echo -e "\e[1;36m ! Written by Griffon - April 2019 - 3.0 - Install-xrdp-3.0.sh           !\e[0m"
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
echo





