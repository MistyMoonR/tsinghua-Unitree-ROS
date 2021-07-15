# Velodyne 激光雷达

系统环境： 
- Ubuntu18.04.5 LTS aarch64
- Kernel 4.9.140-tegra
- ROS melodic 1.14.11

硬件：
- Jetson Xaiver NX
- Velodyne16
----
待解决问题： 
- [ ]  -
----
安装依懒(重要)
``` r
sudo apt-get install ros-VERSION-velodyne
```
安装驱动(需要到自己的工作空间下)
``` r
cd ~/catkin_ws/src/ #需要修改path

git clone https://github.com/ros-drivers/velodyne.git

rosdep install --from-paths src --ignore-src --rosdistro YOURDISTRO -y

cd ~/catkin_ws/ #需要修改path

catkin_make
```

测试(可选)
``` r
roslaunch velodyne_pointcloud VLP16_points.launch

rosnode list

rostopic echo /velodyne_points

rosrun rviz rviz -f velodyne
```

RVIZ
1. In the "displays" panel, click "Add", then select "Point Cloud2", then press "OK".
2. In the "Topic" field of the new "Point Cloud2" tab, enter "/velodyne_points".
3. Congratulations. Now, your Velodyne is ready to build the "real" world inside your system. Enjoy it.


----
来源：
http://wiki.ros.org/velodyne/Tutorials/Getting%20Started%20with%20the%20Velodyne%20VLP16


