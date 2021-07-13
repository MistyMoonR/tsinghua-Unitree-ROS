# Install script for directory: /home/ros/ROS_ws/src/unitree_ros/lslidar_c16/lslidar_c16_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ros/ROS_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lslidar_c16_msgs/msg" TYPE FILE FILES
    "/home/ros/ROS_ws/src/unitree_ros/lslidar_c16/lslidar_c16_msgs/msg/LslidarC16Layer.msg"
    "/home/ros/ROS_ws/src/unitree_ros/lslidar_c16/lslidar_c16_msgs/msg/LslidarC16Packet.msg"
    "/home/ros/ROS_ws/src/unitree_ros/lslidar_c16/lslidar_c16_msgs/msg/LslidarC16Point.msg"
    "/home/ros/ROS_ws/src/unitree_ros/lslidar_c16/lslidar_c16_msgs/msg/LslidarC16Scan.msg"
    "/home/ros/ROS_ws/src/unitree_ros/lslidar_c16/lslidar_c16_msgs/msg/LslidarC16Sweep.msg"
    "/home/ros/ROS_ws/src/unitree_ros/lslidar_c16/lslidar_c16_msgs/msg/LslidarC16ScanUnified.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lslidar_c16_msgs/cmake" TYPE FILE FILES "/home/ros/ROS_ws/build/unitree_ros/lslidar_c16/lslidar_c16_msgs/catkin_generated/installspace/lslidar_c16_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ros/ROS_ws/devel/include/lslidar_c16_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ros/ROS_ws/devel/share/roseus/ros/lslidar_c16_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ros/ROS_ws/devel/share/common-lisp/ros/lslidar_c16_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ros/ROS_ws/devel/share/gennodejs/ros/lslidar_c16_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/ros/ROS_ws/devel/lib/python2.7/dist-packages/lslidar_c16_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/ros/ROS_ws/devel/lib/python2.7/dist-packages/lslidar_c16_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ros/ROS_ws/build/unitree_ros/lslidar_c16/lslidar_c16_msgs/catkin_generated/installspace/lslidar_c16_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lslidar_c16_msgs/cmake" TYPE FILE FILES "/home/ros/ROS_ws/build/unitree_ros/lslidar_c16/lslidar_c16_msgs/catkin_generated/installspace/lslidar_c16_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lslidar_c16_msgs/cmake" TYPE FILE FILES
    "/home/ros/ROS_ws/build/unitree_ros/lslidar_c16/lslidar_c16_msgs/catkin_generated/installspace/lslidar_c16_msgsConfig.cmake"
    "/home/ros/ROS_ws/build/unitree_ros/lslidar_c16/lslidar_c16_msgs/catkin_generated/installspace/lslidar_c16_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lslidar_c16_msgs" TYPE FILE FILES "/home/ros/ROS_ws/src/unitree_ros/lslidar_c16/lslidar_c16_msgs/package.xml")
endif()

