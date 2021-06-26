# tsinghua-Unitree-ROS

## 简介
**Unitree A1 机器狗**       
ROS + SLAM

硬件：  
* Upboard : Z8350处理器 4G内存 64G 硬盘   
* 上位机 : Jetson Xaiver NX / X86
* 激光雷达 : 单线 & 十六线

系统环境： 
- Ubuntu18.04 LTS
- ROS melodic 1.14.11

----
## 文档链接 (重要)

[开发环境 安装 步骤](/Development-environment.md)     

[unitree ros 开发笔记](/Notes.md)     

[键位函数](/keyboard.md)     

---
## 项目进度：
- [x]  测试环境搭建 + 编译驱动和依懒包
- [ ]  Unitree_ROS 的 Gazebo 动力学仿真
- [ ]  unitree_legged_sdk API库研究
- [ ]  LIO-SAM开源的SLAM建模

----
## 引用：

宇树科技 A1 产品介绍：  
https://www.unitree.com/cn/products/a1

A1 ROS相关：  
https://github.com/unitreerobotics/unitree_ros      
https://github.com/unitreerobotics/unitree_legged_sdk

SLAM相关：  
https://github.com/TixiaoShan/LIO-SAM       
https://github.com/borglab/gtsam/releases       

C++ 键位函数：      
https://www.iteye.com/blog/bingtears-663149

Google research:
https://xbpeng.github.io/projects/Robotic_Imitation/index.html
https://ai.googleblog.com/2020/04/exploring-nature-inspired-robot-agility.html