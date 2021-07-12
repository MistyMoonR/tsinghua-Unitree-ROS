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

```
sudo gedit /etc/apt/source.list
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
```
sudo apt-get update
sudo apt -y update
sudo apt-get upgrade
sudo apt -y upgrade
```

----
### Git 安装
```
sudo apt install -y git
```

### SSH server 安装 + 开启
状态查看
```
dpkg -l | grep ssh
```

一般来说直接install openssh-server就行
```
sudo apt-get install -y openssh-server
```

如果不行就重新装
```
sudo apt-get  autoremove  openssh-client openssh-server 
sudo apt-get install -y openssh-client openssh-server
/etc/init.d/ssh restart #重启ssh ，测试成功
```

### XRDP 远程GUI
```
chmod u+x Install-xrdp-3.0.sh
./Install-xrdp-3.0.sh
```

----
## ROS melodic 安装

ROS melodic install

来源： http://wiki.ros.org/melodic/Installation/Ubuntu      

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install curl # if you haven't already installed curl

curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update

sudo apt install -y ros-melodic-desktop-full

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc

sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt install python-rosdep

sudo rosdep init

rosdep update

```

完成安装 下面依懒 + tutorials 方便测试是否装成功(可选)
```
sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt-get install -y ros-melodic-ros-tutorials
```

----
## LIO-SAM + unitree_ros 依赖安装
### LIO-SAM 

来源： https://github.com/TixiaoShan/LIO-SAM

ROS Dependency 
```
sudo apt-get install -y ros-melodic-navigation
sudo apt-get install -y ros-melodic-robot-localization
sudo apt-get install -y ros-melodic-robot-state-publisher
```

GTSAM: Georgia Tech Smoothing and Mapping library   
来源：https://github.com/borglab/gtsam/releases

```
wget -O ~/Downloads/gtsam.zip https://github.com/borglab/gtsam/archive/4.0.2.zip

cd ~/Downloads/ && unzip gtsam.zip -d ~/Downloads/

cd ~/Downloads/gtsam-4.0.2/

mkdir build && cd build

cmake -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF -DGTSAM_USE_SYSTEM_EIGEN=ON ..

sudo make install -j8  #不成功就 -j1
```
LIO-SAM本体安装(可选项)    
**LIO-SAM 需要特别注意是catkin_ws和 unitree_ros的catkin_ws 可能会重叠，后续待解决**
```
cd ~/catkin_ws/src  
git clone https://github.com/TixiaoShan/LIO-SAM.git
cd ..
catkin_make
```

### unitree_ros dependencies

`unitree_ros` 安装前先安装 `Gazebo`(ROS自带)，`untree_legged_sdk`

ROS `unitree_legged_sdk` 前先编译LCM
LCM-UDP： 数据通信相关

```
git clone https://github.com/lcm-proj/lcm.git
cd lcm
mkdir build
cd build
cmake ..
make
sudo make install
```
` unitree_legged_sdk`  编译
```
git clone https://github.com/unitreerobotics/unitree_legged_sdk.git
cd unitree_legged_sdk
mkdir build
cd build
cmake ../
make
sudo make install
```

配置环境变量:  ~/.bashrc
``` yml
source /opt/ros/melodic/setup.bash
# melodic 默认装gazebo-9
source /usr/share/gazebo-9/setup.sh 
# 有需要把catkin_ws替换你的工作空间
source ~/catkin_ws/devel/setup.bash
export ROS_PACKAGE_PATH=~/catkin_ws:${ROS_PACKAGE_PATH}
export GAZEBO_PLUGIN_PATH=~/catkin_ws/devel/lib:${GAZEBO_PLUGIN_PATH}
export LD_LIBRARY_PATH=~/catkin_ws/devel/lib:${LD_LIBRARY_PATH}

export UNITREE_SDK_VERSION=3_2
export UNITREE_LEGGED_SDK_PATH=~/unitree_legged_sdk
# amd64, arm32, arm64 根据你平台设备选择
export UNITREE_PLATFORM="amd64"

```

----
unitree ROS ： `unitree_ros`  编译 (可选)       

文档链接: 
[ROS_ws](\ROS_ws\README.md)

```
mkdir -p catkin_ws/src
cd catkin_ws/src
catkin_init_workspace
git clone https://github.com/unitreerobotics/a1_ros.git
catkin_make
```
----



