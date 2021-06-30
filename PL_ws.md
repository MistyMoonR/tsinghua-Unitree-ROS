# tsinghua-Unitree-ROS

系统环境： 
- Ubuntu18.04 LTS
- ROS melodic 1.14.11
- patroldog_ws

结构： 
* gmapping  SLAM扫描地图底层算法
* lio_sam  开源SLAM算法
* navigation launch包，包含 机器狗控制指令和 2D地图通航指令
* ndt_localization  貌似是关于voxel点云算法（激光雷达用
    * ndt_omp
    * prm_localization
* start  初始化路径 **
* unitree_legged_msgs  宇树科技 信息包
* unitree_legged_real  ROS里面控制物理狗 
* velodyne  16线激光雷达驱动包 




问题：
- [x]  


名词解释：    
X：机器前   
Y：机器左   
Z：机器上   

Leg 0：FR, 右前腿   
Leg 1：FL, 左前腿   
Leg 2：RR, 右后腿       
Leg 3：RL, 左后腿   
Joint 0：Hip, 机身关节  
Joint 1：Thigh, 大腿关节    
Joint 2：Calf, 小腿关节     
e.g. FR_thigh：右前腿大腿关节   

关节限位：
机身关节：-46°~46°  
大腿关节：-60°~240°     
小腿关节：-154.5°~-52.5°        

----

# unitree_legged_sdk 篇
## 控制 ： `unitree_legged_sdk`

详细API参见 [API](/API.md)    

通讯库 `libunitree_legged_sdk.so`   
头文件 `unitree_legged_sdk.h`

* API
    * 高层控制模式
    * 底层控制模式
        * 普通模式 port: 8007
        * 运动模式 port: 8081

这里包含IMU信息

----

# unitree_ros 篇

Tips:   
查看ROS Graph：`rqt_graph`     

## **Gazebo 动力学仿真**  

BUG一堆，还没文档解释变量干啥用...

/unitree_ros/unitree_gaebo/launch/normal.launch 头部可以更改default="a1"

运行部分： 
``` 
roslaunch unitree_gazebo normal.launch 

##下面新开两个终端分别运行
rosrun unitree_controller unitree_servo
rosrun unitree_controller unitree_move_kinetic  #camkelist里面没改，也不影响
``` 

Gazebo本质上是调用a1_description的urdf文件      

[教程：在 Gazebo 中使用 URDF](http://gazebosim.org/tutorials/?tut=ros_urdf)


unitree_controller文件夹里面的CmakeLists.txt


----

## **Rviz 可视化** 

```
# 运行launch 需要连接机器人才行
roslaunch a1_description a1_rviz.launch
```    

----

## **LCM - UDP 数据通信** 

机器狗用于 LCM Server 传输消息, LCM Channel实现

LCM转UDP向下发送，UDP转LCM向上发送。 

并非采用ROS Subscriber/Publisher的方式来传递数据(实时性没保障)

UDP Multicast Setup : https://lcm-proj.github.io/multicast_setup.html

----

# LIO-SAM SLAM建模
LIO-SAM
需要一个IMU传感器，高精度。


----
实物机器狗

参数设置：
patroldog_ws/src/navigation/param/teb_local_planner_params.yaml



----

SLAM相关：      
https://github.com/TixiaoShan/LIO-SAM   
https://github.com/borglab/gtsam/releases

宇树科技相关：      
https://github.com/unitreerobotics/unitree_ros

C++ 键位：       
https://blog.csdn.net/zjsxxzh/article/details/50662833