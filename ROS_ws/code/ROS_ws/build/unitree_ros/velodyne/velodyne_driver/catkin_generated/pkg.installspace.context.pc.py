# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "diagnostic_updater;dynamic_reconfigure;nodelet;roscpp;tf;velodyne_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lvelodyne_input".split(';') if "-lvelodyne_input" != "" else []
PROJECT_NAME = "velodyne_driver"
PROJECT_SPACE_DIR = "/home/ros/ROS_ws/install"
PROJECT_VERSION = "1.6.1"
