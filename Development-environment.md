# Development environment

系统环境： 
- Ubuntu18.04 LTS
- ROS melodic 1.14.11
- Unitree_Ros
----
目录：
- 换清华源(可选)
- Git SSH XRDP安装(建议)
- ROS melodic 安装
- LIO-SAM + unitree_ros 依赖安装
- unitree_legged_sdk 安装
----
待解决问题： 
- [x]  LIO-SAM和unitree_ros的catkin_ws文件名冲突问题
- [x]  修改链接部分到我Github上
- [x]  需要完善整体框架
----

切换清华源(建议)        
来源： https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/

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

更新软件源
``` bash
sudo apt-get update
sudo apt -y update
sudo apt-get upgrade
sudo apt -y upgrade
```

----
### Git 安装
``` bash
sudo apt install -y git
```

### ifconfig 安装
``` bash
sudo apt install -y net-tools
```

### vscode 安装
下载deb包: https://code.visualstudio.com/ 
``` bash
sudo dpkg -i code[tab]
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
sudo apt-get  autoremove  openssh-client openssh-server 
sudo apt-get install -y openssh-client openssh-server
/etc/init.d/ssh restart #重启ssh ，测试成功
```



### XRDP 远程GUI

[`Install-xrdp-3.0.sh`](scripts/Install-xrdp-3.0.sh) 位置在 `tsinghua-Unitree-ROS/scripts`

``` bash
chmod u+x Install-xrdp-3.0.sh
./Install-xrdp-3.0.sh
```

----
## ROS melodic 安装

ROS melodic install

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

完成安装 下面依懒 + tutorials 方便测试是否装成功(可选)
``` bash
sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt-get install -y ros-melodic-ros-tutorials
```

----
## LIO-SAM + unitree_ros 依赖安装
### LIO-SAM 

来源： https://github.com/TixiaoShan/LIO-SAM

ROS Dependency 
``` bash
sudo apt-get install -y ros-melodic-navigation ros-melodic-robot-localization ros-melodic-robot-state-publisher
```

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
LIO-SAM本体安装(可选项)    
**LIO-SAM 需要特别注意是catkin_ws和 unitree_ros的catkin_ws 可能会重叠，后续待解决**
``` bash
cd ~/catkin_ws/src  
git clone https://github.com/TixiaoShan/LIO-SAM.git
cd ..
catkin_make
```

### unitree_ros dependencies

`unitree_ros` 安装前先安装 `Gazebo`(ROS自带)，`untree_legged_sdk`

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
` unitree_legged_sdk`  编译
``` bash
cd
git clone https://github.com/unitreerobotics/unitree_legged_sdk.git
cd unitree_legged_sdk && mkdir build && cd build
cmake ..
make
```

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
```

## librealsense:       
Github tar.gz: [librealsense](https://github.com/IntelRealSense/librealsense/releases/tag/v2.45.0)  

``` bash
cd librealsense
sudo apt update
sudo apt upgrade
sudo apt-get install git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev
sudo apt-get install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && udevadm trigger
mkdir build
cd build
cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=true
sudo make uninstall
make clean
make
sudo make install
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
使用 <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd> 重启电脑


