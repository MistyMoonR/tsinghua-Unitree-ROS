#!/bin/bash

#---------------------------------------------------#
#  用于快速安装一些工具和软件 
#---------------------------------------------------#

echo
/bin/echo -e "\e[1;36m !--------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! apt / apt-get: git + net-tools + openssh-server + terminator !\e[0m"
/bin/echo -e "\e[1;36m ! App: Vscode                                                  !\e[0m"
/bin/echo -e "\e[1;36m ! It will be executed in 3s                                    !\e[0m"
/bin/echo -e "\e[1;36m !--------------------------------------------------------------!\e[0m"
echo

sleep 3s

#---------------------------------------------------#
#  开头先 update 
#---------------------------------------------------#

sudo apt update

sudo apt -y upgrade

sudo apt-get update

sudo apt-get -y upgrade

#---------------------------------------------------#
#  apt 安装
#---------------------------------------------------#

sudo apt install -y git

sudo apt install -y net-tools

sudo apt install -y neofetch

sudo apt install -y htop

sudo apt-get install -y openssh-server

sudo apt-get install -y terminator

#---------------------------------------------------#
#  APP 安装 
#---------------------------------------------------#
 
cd ~/Desktop

wget https://az764295.vo.msecnd.net/stable/c3f126316369cd610563c75b1b1725e0679adfb3/code_1.58.2-1626302803_amd64.deb

sudo dpkg -i code_1.58.2-1626302803_amd64.deb

cd 

echo
/bin/echo -e "\e[1;36m !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! All Installation Completed                  !\e[0m"
/bin/echo -e "\e[1;36m ! 窗口运行 dpkg -l | grep ssh  测试             !\e[0m"
/bin/echo -e "\e[1;36m !---------------------------------------------!\e[0m"
echo





