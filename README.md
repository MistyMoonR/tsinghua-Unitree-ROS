# tsinghua-Unitree-ROS

目录:       

  - [简介](#简介)
    - [硬件](#硬件)
    - [系统环境](#系统环境)
  - [学习资料](#学习资料)
  - [文档说明](#文档说明)
    - [ROS工作空间](#ros工作空间)
    - [南科大patroldog_ws的研究 (已放弃)](#南科大patroldog_ws的研究-已放弃)
  - [文档链接](#文档链接)
  - [项目进度](#项目进度)
  - [Picture](#picture)
    - [硬件架构图](#硬件架构图)
    - [软件架构图](#软件架构图)
  - [硬件相关](#硬件相关)
    - [intel D435i 双目摄像头相关(由于玄学问题，需要降级到v2.45.0版本):](#intel-d435i-双目摄像头相关由于玄学问题需要降级到v2450版本)
    - [Velodyne 16线激光雷达:](#velodyne-16线激光雷达)
    - [镭神激光雷达 C16:](#镭神激光雷达-c16)
    - [九轴IMU - Spatial:](#九轴imu---spatial)
  - [引用](#引用)

## 简介
[**Unitree A1 机器狗**](https://www.unitree.com/cn/products/a1)  

[ROS melodic](http://wiki.ros.org/melodic) + [SLAM](https://github.com/MistyMoonR/tsinghua-SLAM)

### 硬件：  
* Upboard : Z8350处理器 4G内存 64G 硬盘   
* 上位机 : [Jetson Xaiver NX](https://developer.nvidia.com/embedded/jetson-xavier-nx) / NUC8 i7-8650U
* 激光雷达 : [Velodyne-16](data/Velodyne_16.md) / [镭神 C16](data/lslidar_c16.md)
* IMU: [Advanced Navigation Spatial + Tallysman GPS](data/Spatial.md)
* 摄像头: [intel D435i](data/intel-D435i.md)

### 系统环境： 
- Ubuntu18.04 LTS
- ROS melodic 1.14.11

----
## 学习资料:

**[机器人操作系统（ROS）浅析](doc/机器人操作系统（ROS）浅析.pdf)**

## 文档说明

**分两条线路进行**
### [ROS工作空间](ROS_ws)

- 激光雷达: [Velodyne](data/Velodyne_16.md) / [Lslidar](data/lslidar_c16.md)
- 9轴IMU: [Spatial](data/Spatial.md)
- 双目摄像头: [intel D435i](data/intel-D435i.md)

### [南科大patroldog_ws的研究](patroldog_ws) (已放弃)

## 文档链接

- **[ROS_ws](ROS_ws/README.md)**
- **[开发环境 安装 步骤](Development-environment.md)**     
- [unitree ros 开发笔记](Notes.md)     
- [unitree API接口协议](data/API.md)     
- [键位函数](data/keyboard.md)     
- [intel D435i摄像头](data/intel-D435i.md)
- [Velodyne-16线激光雷达](data/Velodyne_16.md)    
- [镭神激光雷达](data/lslidar_c16.md)
- [Spatial 九轴IMU](data/Spatial.md)

---
## 项目进度：
- [x]  测试环境搭建 + 编译驱动和依懒包(unitree_ros)
- [x]  Unitree_ROS 的 Gazebo 动力学仿真(中止)
- [x]  unitree_legged_sdk API库研究(不用看，基于ROS上运行)
- [ ]  LIO-SAM开源的SLAM建模
- [x]  研究patroldog_ws 相关代码(能运行基本功能，需二次开发)
- [ ]  构建自己的ROS_ws项目，完善文档
- [ ]  TF坐标变换 


----
## Picture:

### 硬件架构图
<center><img src="pictures/HW.png" width="90%"/></center>

### 软件架构图
<center><img src="pictures/SW.png" width="90%"/></center>

----

## 硬件相关:
### intel D435i 双目摄像头相关(由于玄学问题，需要降级到v2.45.0版本):  
Github: [librealsense](https://github.com/IntelRealSense/librealsense/releases/tag/v2.45.0)      
ROS: [realsense-ros](https://github.com/IntelRealSense/realsense-ros)

### Velodyne 16线激光雷达:     
Github:  [velodyne](https://github.com/ros-drivers/velodyne.git)        
ROS wiki: [Getting Started with the Velodyne VLP16](http://wiki.ros.org/velodyne/Tutorials/Getting%20Started%20with%20the%20Velodyne%20VLP16)

### 镭神激光雷达 C16:    
Github:  [lslidar_c16](https://github.com/tianb03/lslidar_c16)      
博客: [镭神激光雷达官方驱动安装适配](https://www.jianshu.com/p/d8efdf333e98)

### 九轴IMU - Spatial:     
Official website: [Spatial](https://www.advancednavigation.com/products/spatial)        
ROS wiki: [advanced_navigation_driver](http://wiki.ros.org/advanced_navigation_driver)   

----
## 引用：
     
宇树科技 A1 产品介绍：  
https://www.unitree.com/cn/products/a1

A1 ROS相关：  
https://github.com/unitreerobotics/unitree_ros      
https://github.com/unitreerobotics/unitree_legged_sdk


C++ 键位函数：      
https://www.iteye.com/blog/bingtears-663149

第三方运动控制：        
https://github.com/lnotspotl/a1_sim_py 

Google research:        
https://xbpeng.github.io/projects/Robotic_Imitation/index.html      
https://ai.googleblog.com/2020/04/exploring-nature-inspired-robot-agility.html


----