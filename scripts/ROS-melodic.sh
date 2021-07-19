#!/bin/bash

#---------------------------------------------------#
#  换清华源 用于提高速度 (非大陆用户自行删除) .... 
#---------------------------------------------------#

echo
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! 将会执行换清华源 + 软件更新 + ROS melodic 和依懒的安装                      !\e[0m"
/bin/echo -e "\e[1;36m ! 此过程会花费较长时间，取决于你电脑的网速和性能，不如泡杯Java喝                  !\e[0m"
/bin/echo -e "\e[1;36m ! 3秒钟后将会执行                                                         !\e[0m"
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
echo

sleep 3s

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

sudo rm -rf /etc/apt/sources.list

# 由于linux的feature，sudo 只对 echo起作用，没有对>>起作用。因此采用touch然后mv方法
touch ~/Desktop/sources.list

sudo echo "# 清华镜像源" >> ~/Desktop/sources.list

sudo echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释" >> ~/Desktop/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" >> ~/Desktop/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" >> ~/Desktop/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> ~/Desktop/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> ~/Desktop/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> ~/Desktop/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> ~/Desktop/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> ~/Desktop/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> ~/Desktop/sources.list

sudo mv ~/Desktop/sources.list /etc/apt/

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
sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt-get install -y ros-melodic-navigation ros-melodic-robot-localization ros-melodic-robot-state-publisher

sudo apt-get install -y ros-melodic-ddynamic-reconfigure       

sudo apt-get install -y libpcap-dev

echo
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! All Installation Completed                                                !\e[0m"
/bin/echo -e "\e[1;36m !-----------------------------------------------------------------------!\e[0m"
echo





