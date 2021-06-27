# API

unitree_legged_sdk


## 高层控制模式
* 普通模式 Port: 8007
* 运动模式 Port: 8081

| **HighState** | **意义** |
| :-----| :---- |
| levelFlag | 高、底层模式标志：“0x00”为高层，“0xff”为底层 |
| mode | 机器人当前模式：“1”为站立模式，“2”为行走模式  切换模式需要 1s 左右的耗时  |
| imu | 包括陀螺仪、加速度计、温度，解算出的欧拉角与四元数 |
| forwardSpeed | 向前走动的速度 |
| sideSpeed | 侧向行走的速度 |
| rotateSpeed | 身体旋转速度 |
| bodyHeight | 身体当前高度 |
| updownSpeed | 站立或蹲下的速度XX |
| forwardPosition | 身体前方的目标位置 |
| sidePosition | 身体的侧向目标位置 |
| footPosition2Body | 相对于身体的足部位置 |
| footSpeed2Body | 相对于身体的足部速度 |
| footForce | 足端受到的力 |
| tick | 运动控制器返回从机器人开机开始计时的参考时间 |
| wirelessRemote | 无线命令 |
| crc | 校验位 |
| **指令 HighCmd** |  |
| levelFlag | 同上 |
| mode | 同上 |
| forwardSpeed | 向后/前移动指令，取值范围(-1~1)，对应(-0.7~1 米每秒)的分段线性比例值（取 0 为分界点），前进最大 1m/s  后退最大 0.7m/s |
| sideSpeed | 向右/左移动指令，取值范围(-1~1)，对应(-0.4~0.4 米每秒)的线性比例值 |
| rotateSpeed | 向右/左旋转指令，取值范围(-1~1)，对应(-120~120 度每秒)的线性比例值 |
| bodyHeight | 调整站立高度指令，取值范围(-1~1)，对应(0.3~0.45 米)的分段线性比例值（取 0.41 米为分界点，即默认高度） |
| yaw | 偏航指令，取值范围(-1~1)，对应(-28~28 度)的线性比例值 |
| pitch | 俯仰指令，取值范围(-1~1)，对应(-20~20 度)的线性比例值 |
| roll | 横滚指令，取值范围(-1~1)，对应(-20~20 度)的线性比例值 |
| led | 保留位 |
| wirelessRemote | 同上 |
| crc | 同上 |


## 底层控制模式
电机控制
* 力矩模式
* 速度模式
* 位置模式

| **LowState** | **意义** |
| :-----| :---- |
| levelFlag |  |
| imu |  |
| motorState | 包括目标电机双编码器的位置、速度、转矩、温度，以及工作模式 |
| footForce |  |
| tick |  |
| wirelessRemote |  |
| crc |  |
| **指令 LowCmd** |  |
| levelFlag |  |
| motorCmd | 包括目标电机的位置、速度、转矩、刚度系数、阻尼系数，以及工作模式 |
| led |  |
| wirelessRemote |  |
| crc |  |



----



----