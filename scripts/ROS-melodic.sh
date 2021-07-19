#!/bin/bash

#---------------------------------------------------#
#  换清华源 用于提高速度 (非大陆用户自行删除) .... 
#---------------------------------------------------#


sudo echo "[*] 将原sources.list 备份为 sources.list.bak"
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

sudo echo "[*] 正在将 清华源 覆盖到/etc/apt/sources.list..."

sudo rm -rf /etc/apt/sources.list

sudo touch /etc/apt/sources.list

sudo echo "# 清华镜像源" >> /etc/apt/sources.list

sudo echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释" >> /etc/apt/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list

echo
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! 换源 Completed                                                         !\e[0m"
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
echo

#---------------------------------------------------#
#  Detecting if Parameters passed to script .... 
#---------------------------------------------------#

sudo apt update

sudo apt -y upgrade

sudo apt-get update

sudo apt-get -y upgrade

echo
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! apt undate & upgrade Completed                                                !\e[0m"
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
echo

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install -y curl # if you haven't already installed curl

curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update

sudo apt install -y ros-melodic-desktop-full

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc

sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo rosdep init

rosdep update

echo
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! ROS melodic Installation Completed                                                !\e[0m"
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
echo

# 下面依懒可选，自行删除
# sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

# sudo apt-get install -y ros-melodic-navigation ros-melodic-robot-localization ros-melodic-robot-state-publisher

# sudo apt-get install -y ros-melodic-ddynamic-reconfigure       

# sudo apt-get install -y libpcap-dev

echo
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! Installation Completed                                                !\e[0m"
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
echo





