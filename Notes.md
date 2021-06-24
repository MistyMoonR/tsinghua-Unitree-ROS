# tsinghua-Unitree-ROS

系统环境： 
- Ubuntu18.04 LTS
- ROS melodic 1.14.11
- Unitree_Ros

----

## 控制 ： `unitree_legged_sdk`

通讯库 `libunitree_legged_sdk.so`   
头文件 `unitree_legged_sdk.h`

* API
    * 高层控制模式
    * 底层控制模式
        * 普通模式 port: 8007
        * 运动模式 port: 8081

这里包含IMU信息


----

## 查看状态 ： `unitree_ros`

问题：
- [x]  API里没找到机器狗IMU传感器返回信息，SLO-SAM需要。 已经解决：在unitree_legged_sdk的通讯库里

**Rviz 可视化** 

```
# 运行launch 需要连接机器人才行
roslaunch a1_description a1_rviz.launch
```    

**Gazebo 动力学仿真**    

BUG一堆，还没文档解释变量干啥用...

``` 
roslaunch unitree_gazebo normal.launch rname:=a1 wname:=stairs  #wname是场景，不过貌似有点问题，去掉能运行，

##下面新开两个终端分别运行
rosrun unitree_controller unitree_servo
rosrun unitree_controller unitree_move_kinetic  #camkelist里面没改，也不影响

``` 

unitree_controller文件夹里面的CmakeLists.txt
``` 
add_executable(unitree_external_force src/external_force.cpp)
target_link_libraries(unitree_external_force ${catkin_LIBRARIES})

add_executable(unitree_servo src/servo.cpp)
target_link_libraries(unitree_servo ${PROJECT_NAME} ${catkin_LIBRARIES})

add_executable(unitree_move_kinetic src/move_publisher.cpp)
target_link_libraries(unitree_move_kinetic ${catkin_LIBRARIES})
``` 
----

## 数据通信： LCM - UDP

机器狗用于 LCM Server 传输消息, LCM Channel实现

LCM转UDP向下发送，UDP转LCM向上发送。 

并非采用ROS Subscriber/Publisher的方式来传递数据(实时性没保障)

UDP Multicast Setup : https://lcm-proj.github.io/multicast_setup.html

----
## 激光雷达 2D-SLAM
LIO-SAM
需要一个IMU传感器，高精度。


----

SLAM相关：  
https://github.com/TixiaoShan/LIO-SAM
https://github.com/borglab/gtsam/releases

宇树科技相关：  
https://github.com/unitreerobotics/unitree_ros

C++ 键盘记录
https://blog.csdn.net/zjsxxzh/article/details/50662833