# ROS_ws 构建过程

**[Releases版本](code/Releases.md)**

系统环境： 
- Ubuntu18.04 LTS
- ROS melodic 1.14.11
- Unitree_Ros change to ROS_ws

硬件：
- NUC8 i7-8650U
----

目录： 
* unitree_ros     
* realsense_ros
* velodyne
* lslidar_c16


问题：
- [ ]  使用镭神激光雷达需要把本机IP地址改成192.168.1.102 (很不喜欢这一设定) , 而且 扫描图像可能有问题。    
- [ ] No

## 系统框架图
![IMG](pictures/ROS_ws_V0.3.png)

----

# 基于宇树科技的unitree_ros构建一个工作空间
## 

基本思路： 下载`unitree_ros`然后编译，注意 `~/.bashrc`文件      
然后装入相机ROS： https://github.com/IntelRealSense/realsense-ros       

激光雷达ROS：
https://github.com/ros-drivers/velodyne.git

说明文档： http://wiki.ros.org/velodyne/Tutorials/Getting%20Started%20with%20the%20Velodyne%20VLP16
## 
  

----

## 首先需要安装环境 (重要)

[开发环境 安装 步骤](/Development-environment.md)     

----

## 镭神激光雷达包
来源： https://github.com/tianb03/lslidar_c16

测试：  

``` r
roslaunch lslidar_c16_decoder lslidar_c16.launch --screen    
```
需要把 `Global Options` 中修改为 `/laser_link`

![IMG](pictures/lslidar_c16_7.13.png)

----

## 九轴IMU - Spatial :  
来源：https://www.advancednavigation.com/products/spatial 

![IMG](pictures/spatial.png)
----




----

SLAM相关：      
https://github.com/TixiaoShan/LIO-SAM   
https://github.com/borglab/gtsam/releases

宇树科技相关：      
https://github.com/unitreerobotics/unitree_ros

C++ 键位：       
https://blog.csdn.net/zjsxxzh/article/details/50662833