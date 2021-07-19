# Development environment

系统环境： 
- Ubuntu18.04 LTS
- ROS melodic 1.14.11
- Unitree_Ros
----
目录：
- [**脚本**](#脚本)
- [安装过程(这是一个痛苦的过程)](#安装过程这是一个痛苦的过程)
  - [切换清华源(建议)](#切换清华源建议)
  - [tools 安装](#tools-安装)
  - [App 安装(建议)](#app-安装建议)
  - [ROS melodic 安装](#ros-melodic-安装)
    - [ROS melodic install](#ros-melodic-install)
    - [ROS 依懒](#ros-依懒)
  - [SLAM + Unitree 依赖安装](#slam--unitree-依赖安装)
    - [GTSAM 安装](#gtsam-安装)
    - [LIO-SAM本体安装(可选项)](#lio-sam本体安装可选项)
    - [LCM 安装](#lcm-安装)
  - [unitree_legged_sdk安装](#unitree_legged_sdk安装)
  - [环境变量配置](#环境变量配置)
  - [librealsense 安装](#librealsense-安装)
----
待解决问题： 
- [x]  LIO-SAM和unitree_ros的catkin_ws文件名冲突问题
- [x]  修改链接部分到我Github上
- [x]  需要完善整体框架
----

# **脚本**

**安装过程较为繁琐，写了脚本来完成大部分安装工作**

[ROS-melodic.sh](scripts/ROS-melodic.sh) 位置在 `tsinghua-Unitree-ROS/scripts`    
包括: <kbd>换清华源</kbd> + <kbd>软件更新</kbd> + <kbd>ROS melodic</kbd> 本体和依懒的安装

[Tool+App-Install.sh](scripts/Tool+App-Install.sh) 位置在 `tsinghua-Unitree-ROS/scripts`    
包括: <kbd>git</kbd> + <kbd>net-tools</kbd> + <kbd>openssh-server</kbd> + <kbd>terminator</kbd> + <kbd>neofetch</kbd> + <kbd>htop</kbd> 和 <kbd>VScode</kbd>

[Unitree-A1-environment.sh](scripts/Unitree-A1-environment.sh) 位置在 `tsinghua-Unitree-ROS/scripts`    
包括: <kbd>GTSAM</kbd> + <kbd>LCM</kbd> + <kbd>unitree_legged_sdk</kbd> + <kbd>librealsense</kbd> 


用法: 以 `ROS-melodic.sh` 为列
``` bash
chmod u+x ROS-melodic.sh
./ROS-melodic.sh
```

----

# 安装过程(这是一个痛苦的过程)

## 切换清华源(建议)       


来源： https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/

或者可以自行替换 中科大源: http://mirrors.ustc.edu.cn/help/ubuntu.html    
PS: USTC 里面的 `sed` 用法太骚了

``` bash
sudo gedit /etc/apt/sources.list
```
把以下内容都复制粘贴进去

``` yml
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
```

----
## tools 安装

### 更新软件源

``` bash
sudo apt update
sudo apt -y upgrade
sudo apt-get update
sudo apt-get -y upgrade
```

### Git 安装
``` bash
sudo apt install -y git
```

### ifconfig 安装
``` bash
sudo apt install -y net-tools
```

### 修改静态IP地址(可选)  
来源: [Ubuntu 18.04 修改静态ip](https://blog.csdn.net/weixin_44058333/article/details/104068376) 
``` bash
sudo gedit /etc/netplan/01-network-manager-all.yaml
``` 
模板:
``` yaml
network:
  version: 2
  #renderer: NetworkManager
  ethernets:
    enp97s0f0:
        addresses: [192.168.1.102/24] #镭神激光雷达指定host
        gateway4: 192.168.1.1 #路由器IP
        dhcp4: no
        dhcp6: no
        optional: true
``` 
配置生效
``` bash
sudo netplan apply
``` 

### SSH server 安装 + 开启
状态查看
``` bash
dpkg -l | grep ssh
```

一般来说直接install openssh-server就行
``` bash
sudo apt-get install -y openssh-server
```

如果不行就重新装
``` bash
sudo apt-get autoremove  openssh-client openssh-server 
sudo apt-get install -y openssh-client openssh-server
/etc/init.d/ssh restart #重启ssh ，测试成功
```
## App 安装(建议)

### vscode 安装
下载deb包: https://code.visualstudio.com/ 
``` bash
sudo dpkg -i code[tab]
``` 
### 分屏终端
``` bash
sudo apt-get install -y terminator
``` 
### XRDP 远程GUI

[`Install-xrdp-3.0.sh`](scripts/Install-xrdp-3.0.sh) 位置在 `tsinghua-Unitree-ROS/scripts`

``` bash
chmod u+x Install-xrdp-3.0.sh
./Install-xrdp-3.0.sh
```

----
## ROS melodic 安装 

安装方式有两种: 
1. 用脚本安装(建议)
2. 像个机器人一样一个一个输入下面bash命令

### ROS melodic install

来源： http://wiki.ros.org/melodic/Installation/Ubuntu      

``` bash
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

```
### ROS 依懒

完成安装 下面依懒 + tutorials 方便测试是否装成功(可选)

``` bash
sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt-get install -y ros-melodic-navigation ros-melodic-robot-localization ros-melodic-robot-state-publisher

# 虚拟机测试发现缺下面依赖
sudo apt-get install -y ros-melodic-ddynamic-reconfigure       

sudo apt-get install -y libpcap-dev
```

测试(可选)
```bash
sudo apt-get install -y ros-melodic-ros-tutorials
```

----
## SLAM + Unitree 依赖安装

### GTSAM 安装
GTSAM: Georgia Tech Smoothing and Mapping library   
来源：https://github.com/borglab/gtsam/releases

``` bash
wget -O ~/Downloads/gtsam.zip https://github.com/borglab/gtsam/archive/4.0.2.zip

cd ~/Downloads/ && unzip gtsam.zip -d ~/Downloads/

cd ~/Downloads/gtsam-4.0.2/

mkdir build && cd build

cmake -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF -DGTSAM_USE_SYSTEM_EIGEN=ON ..

sudo make install  #不成功就后面 -j1 (内存过小) 
```

### LIO-SAM本体安装(可选项)   

**LIO-SAM 需要特别注意是catkin_ws和 unitree_ros的catkin_ws 可能会重叠，后续待解决**
``` bash
cd ~/catkin_ws/src  
git clone https://github.com/TixiaoShan/LIO-SAM.git
cd ..
catkin_make
```

### LCM 安装

ROS `unitree_legged_sdk` 前先编译LCM
LCM-UDP： 数据通信相关

``` bash
cd
git clone https://github.com/lcm-proj/lcm.git
cd lcm && mkdir build && cd build
cmake ..
make
sudo make install
```

## unitree_legged_sdk安装

来源: https://github.com/unitreerobotics/unitree_legged_sdk

``` bash
cd
git clone https://github.com/unitreerobotics/unitree_legged_sdk.git
cd unitree_legged_sdk && mkdir build && cd build
cmake ..
make
```

## 环境变量配置
配置环境变量:  ~/.bashrc
``` yml
source /opt/ros/melodic/setup.bash
# melodic 默认装gazebo-9
source /usr/share/gazebo-9/setup.sh 
# 有需要把catkin_ws替换你的工作空间
export ROS_PACKAGE_PATH=~/catkin_ws:${ROS_PACKAGE_PATH}
export GAZEBO_PLUGIN_PATH=~/catkin_ws/devel/lib:${GAZEBO_PLUGIN_PATH}
export LD_LIBRARY_PATH=~/catkin_ws/devel/lib:${LD_LIBRARY_PATH}

export UNITREE_SDK_VERSION=3_2
export UNITREE_LEGGED_SDK_PATH=~/unitree_legged_sdk
# amd64, arm32, arm64 根据你平台设备选择
export UNITREE_PLATFORM="amd64"
# 可选
source ~/ROS_ws/devel/setup.bash
```

## librealsense 安装
Download tar.gz            
Github [librealsense](https://github.com/IntelRealSense/librealsense/releases/tag/v2.45.0)  

``` bash
cd librealsense
sudo apt update && sudo apt -y upgrade
sudo apt-get install -y git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev
sudo apt-get install -y libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && udevadm trigger
mkdir build && cd build
cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=true
sudo make uninstall
make clean
make ##不能多核编译，会报错(应该是内存不足原因)
sudo make install
``` 

测试
``` bash
realsense-viewer 
```

----

unitree ROS ： `unitree_ros`  编译 (可选)       

文档链接: 
[ROS_ws](\ROS_ws\README.md)

``` bash
mkdir -p catkin_ws/src
cd catkin_ws/src
catkin_init_workspace
git clone https://github.com/unitreerobotics/a1_ros.git
catkin_make
```

----

