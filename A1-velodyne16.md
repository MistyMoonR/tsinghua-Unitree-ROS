# Development environment

系统环境： 
- Ubuntu18.04.5 LTS aarch64
- Kernel 4.9.140-tegra
- ROS melodic 1.14.11

硬件： 
- NVIDIA Jetson Xavier NX

home：
- patroldog_ws
- unitree_legged_sdk


----
待解决问题： 
- [ ]  
- [ ]  
----

安装过程前手动更新，看情况是否换源
```
sudo nano /etc/apt/source.list
```

注释里面的所有内容，将下列内容复制到文件里

```
deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse

deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
```

更新软件源



```
sudo apt-get update
sudo apt -y update
sudo apt-get upgrade
sudo apt -y upgrade
```

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

### ROS melodic install

```
sudo sh -c ‘echo “deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main” > /etc/apt/sources.list.d/ros-latest.list’
sudo apt-key adv —keyserver ‘hkp://keyserver.ubuntu.com:80’ —recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt install -y ros-melodic-desktop-full
sudo apt install -y rospack-tools
sudo rosdep init
rosdep update
echo “source /opt/ros/melodic/setup.bash” >> ~/.bashrc
source ~/.bashrc
```

完成安装 下面依懒 + tutorials 方便测试是否装成功
```
sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt-get install -y ros-melodic-ros-tutorials
```

### LIO-SAM 运行依赖 SLAM相关

摘录自： https://github.com/TixiaoShan/LIO-SAM

ROS Dependency 
```
sudo apt-get install -y ros-melodic-navigation
sudo apt-get install -y ros-melodic-robot-localization
sudo apt-get install -y ros-melodic-robot-state-publisher
```

[GTSAM](https://github.com/borglab/gtsam/releases): Georgia Tech Smoothing and Mapping library

```
wget -O ~/Downloads/gtsam.zip https://github.com/borglab/gtsam/archive/4.0.2.zip
cd ~/Downloads/ && unzip gtsam.zip -d ~/Downloads/
cd ~/Downloads/gtsam-4.0.2/
mkdir build && cd build
cmake -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF -DGTSAM_USE_SYSTEM_EIGEN=ON ..
sudo make install -j8  #不成功就 -j1
```

**LIO-SAM 需要特别注意是catkin_ws和 unitree_ros的catkin_ws 可能会重叠，后续待解决**
```
cd ~/catkin_ws/src
git clone https://github.com/TixiaoShan/LIO-SAM.git
cd ..
catkin_make
```


### unitree_ros dependencies

`unitree_ros` 安装前先安装 `Gazebo`(好像ROS自带)，`untree_legged_sdk`

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

配置环境变量
```
echo "export UNITREE_LEGGED_SDK_PATH=~/unitree_legged_sdk" >> ~/.bashrc
echo "export ALIENGO_SDK_PATH=~/aliengo_sdk" >> ~/.bashrc
#amd64, arm32, arm64
echo "export UNITREE_PLATFORM=amd64" >> ~/.bashrc
```

unitree ROS ： `unitree_ros`  编译 (可选)

```
mkdir -p catkin_ws/src
cd catkin_ws/src
catkin_init_workspace
git clone https://github.com/unitreerobotics/a1_ros.git
catkin_make
```

----


