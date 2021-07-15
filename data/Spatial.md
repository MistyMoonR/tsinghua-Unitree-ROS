# Spatial 九轴IMU 

系统环境:
- Ubuntu18.04.5 LTS
- Kernel 4.9.140-tegra
- ROS melodic 1.14.11

硬件: 
- NUC8 i7-8650U
- Advanced Navigation Spatial + Tallysman GPS

文件: 
- [spatial-SDK](Spatial/spatial-SDK)
- [SpatialManager-5.8.jar](Spatial/SpatialManager-5.8.jar)
- [Spatial Reference Manual.pdf](/doc/Spatial%20Reference%20Manual.pdf)

----
待解决问题： 
- [ ]  Spatial 九轴陀螺仪有ROS包，官方(MIT)提供的包发现CPU占用过高，Github上有另外fork，但是放到ROS_ws编译不通过，先放着
- [ ]  ROS包里面没发现GPS，后续查看
----

## 安装ROS驱动(需要到自己的工作空间下)     
来源有两种:        
http://wiki.ros.org/advanced_navigation_driver  (CPU占用过高)   
https://github.com/kylerlaird/advanced_navigation_driver (编译不通过)   

测试: 
``` r
rosrun advanced_navigation_driver advanced_navigation_driver
``` 

**Advanced Navigation 提供的JAR工具包**
``` r
sudo java -jar SpatialManager-5.8.jar 
``` 


----
来源：
https://www.advancednavigation.com/products/spatial

https://github.com/kylerlaird/advanced_navigation_driver


