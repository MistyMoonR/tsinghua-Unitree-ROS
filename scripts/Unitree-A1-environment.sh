#!/bin/bash

#---------------------------------------------------#
#  用于安装各种东西，不定期更新, 由于保险起见，编译默认 -j1
#  虚拟机测试脚本 ROS_ws 没编译通过，正在排查问题
#---------------------------------------------------#

echo
/bin/echo -e "\e[1;36m !--------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! GTSAM + LCM + unitree_legged_sdk + librealsense              !\e[0m"
/bin/echo -e "\e[1;36m !                                                              !\e[0m"
/bin/echo -e "\e[1;36m ! It will be executed in 3s                                    !\e[0m"
/bin/echo -e "\e[1;36m !--------------------------------------------------------------!\e[0m"
echo

sleep 3s

#---------------------------------------------------#
#  开头先 update 
#---------------------------------------------------#

sudo apt update

sudo apt -y upgrade

#---------------------------------------------------#
#  GTSAM 安装
#---------------------------------------------------#

cd 

wget -O ~/Downloads/gtsam.zip https://github.com/borglab/gtsam/archive/4.0.2.zip

cd ~/Downloads/ && unzip gtsam.zip -d ~/Downloads/

cd ~/Downloads/gtsam-4.0.2/

mkdir build && cd build

cmake -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF -DGTSAM_USE_SYSTEM_EIGEN=ON ..

sudo make install -j1 #不成功就后面 -j1 (内存过小) 

#---------------------------------------------------#
#  LCM 安装 
#---------------------------------------------------#
 
cd

git clone https://github.com/lcm-proj/lcm.git

cd lcm && mkdir build && cd build

cmake ..

make -j1

sudo make install

#---------------------------------------------------#
#  unitree_legged_sdk 安装 
#---------------------------------------------------#
 
cd

git clone https://github.com/unitreerobotics/unitree_legged_sdk.git

cd unitree_legged_sdk && mkdir build && cd build

cmake ..

make -j1

#---------------------------------------------------#
#  修改 ~/.bashrc 
#---------------------------------------------------#

cd

sudo echo "source /usr/share/gazebo-9/setup.sh" >> ~/.bashrc
sudo echo "# 有需要把catkin_ws替换你的工作空间" >> ~/.bashrc
sudo echo "export ROS_PACKAGE_PATH=~/catkin_ws:${ROS_PACKAGE_PATH}" >> ~/.bashrc
sudo echo "export GAZEBO_PLUGIN_PATH=~/catkin_ws/devel/lib:${GAZEBO_PLUGIN_PATH}" >> ~/.bashrc
sudo echo "export LD_LIBRARY_PATH=~/catkin_ws/devel/lib:${LD_LIBRARY_PATH}" >> ~/.bashrc
sudo echo "export UNITREE_SDK_VERSION=3_2" >> ~/.bashrc
sudo echo "export UNITREE_LEGGED_SDK_PATH=~/unitree_legged_sdk" >> ~/.bashrc
sudo echo "# amd64, arm32, arm64 根据你平台设备选择" >> ~/.bashrc
sudo echo "export UNITREE_PLATFORM="amd64"" >> ~/.bashrc
sudo echo "# 可选" >> ~/.bashrc
sudo echo "source ~/ROS_ws/devel/setup.bash" >> ~/.bashrc

source ~/.bashrc

#---------------------------------------------------#
#  librealsense 安装 
#---------------------------------------------------#
cd

cd Desktop

wget https://github.com/IntelRealSense/librealsense/archive/refs/tags/v2.45.0.tar.gz

tar -zxf v2.45.0.tar.gz

cd librealsense-2.45.0

sudo apt-get install -y git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev
sudo apt-get install -y libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && udevadm trigger
mkdir build && cd build
cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=true
sudo make uninstall
make clean
make 
sudo make install


echo
/bin/echo -e "\e[1;36m !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m ! All Installation Completed                  !\e[0m"
/bin/echo -e "\e[1;36m ! 窗口运行 realsense-viewer   测试             !\e[0m"
/bin/echo -e "\e[1;36m !---------------------------------------------!\e[0m"
echo







