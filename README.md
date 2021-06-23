# tsinghua-Unitree-ROS

系统环境： 
- Ubuntu18.04 LTS
- ROS melodic 1.14.11
- Unitree_Ros

安装过程前手动更新，看情况是否换源
```
sudo apt-get update
sudo apt update
sudo apt-get upgrade -y
sudo apt upgrade -y
```

### Git 安装
```
sudo apt install git
```

### SSH server 安装 + 开启
状态查看
```
dpkg -l | grep ssh
```

一般来说直接install openssh-server就行
```
sudo apt-get install openssh-server
```

如果不行就重新装
```
sudo apt-get  autoremove  openssh-client openssh-server 
sudo apt-get install openssh-client openssh-server
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
sudo apt install ros-melodic-desktop-full
sudo apt install rospack-tools -y
sudo rosdep init
rosdep update
echo “source /opt/ros/melodic/setup.bash” >> ~/.bashrc
source ~/.bashrc
```

完成安装 下面依懒 + tutorials 方便测试是否装成功
```
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo apt-get install ros-melodic-ros-tutorials
```

### unitree_ros dependencies

`unitree_ros` 安装前先安装 `Gazebo`(好像ROS自带)，`untree_legged_sdk`

ROS `unitree_legged_sdk` 前先编译LCM

```
git clone https://github.com/lcm-proj/lcm.git
cd lcm
mkdir build
cd build
cmake ..
make
sudo make install
```

unitree_legged_sdk 编译
```
git clone https://github.com/unitreerobotics/unitree_legged_sdk.git
cd unitree_legged_sdk
mkdir build
cd build
cmake ../
make
sudo make install
```

unitree ROS ： `unitree_ros` 
```
mkdir -p catkin_ws/src
cd catkin_ws/src
catkin_init_workspace
git clone https://github.com/unitreerobotics/a1_ros.git
catkin_make
```

----
### 其他

echo $ROS_PACKAGE_PATH   /home/ros/catkin_ws/src:/opt/ros/indigo/share:/opt/ros/indigo/stacks



