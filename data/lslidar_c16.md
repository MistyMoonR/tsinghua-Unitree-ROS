# 镭神 激光雷达

系统环境： 
- Ubuntu18.04.5 LTS 
- ROS melodic 1.14.11
- Unitree_Ros change to ROS_ws

硬件：
- NUC8 i7-8650U
- 镭神激光雷达 C16

----
问题： 
- [x] 使用镭神激光雷达需要把本机IP地址改成192.168.1.102 (很不喜欢这一设定) , 而且 扫描图像可能有问题。   
- [ ] Global Options 修改 
----

## 镭神激光雷达包
来源： https://github.com/tianb03/lslidar_c16

测试：  

``` r
roslaunch lslidar_c16_decoder lslidar_c16.launch --screen    
```
需要把 `Global Options` 中修改为 `/laser_link`

![IMG](/ROS_ws/pictures/lslidar_c16_7.13.png)


----
来源：
http://wiki.ros.org/velodyne/Tutorials/Getting%20Started%20with%20the%20Velodyne%20VLP16


