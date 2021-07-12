# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "unitree_legged_msgs: 9 messages, 0 services")

set(MSG_I_FLAGS "-Iunitree_legged_msgs:/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(unitree_legged_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg" NAME_WE)
add_custom_target(_unitree_legged_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_legged_msgs" "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg" ""
)

get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg" NAME_WE)
add_custom_target(_unitree_legged_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_legged_msgs" "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg" ""
)

get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg" NAME_WE)
add_custom_target(_unitree_legged_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_legged_msgs" "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg" ""
)

get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg" NAME_WE)
add_custom_target(_unitree_legged_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_legged_msgs" "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg" "unitree_legged_msgs/MotorCmd:unitree_legged_msgs/LED:unitree_legged_msgs/Cartesian"
)

get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg" NAME_WE)
add_custom_target(_unitree_legged_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_legged_msgs" "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg" ""
)

get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg" NAME_WE)
add_custom_target(_unitree_legged_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_legged_msgs" "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg" ""
)

get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg" NAME_WE)
add_custom_target(_unitree_legged_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_legged_msgs" "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg" "unitree_legged_msgs/Cartesian:unitree_legged_msgs/IMU"
)

get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg" NAME_WE)
add_custom_target(_unitree_legged_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_legged_msgs" "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg" "unitree_legged_msgs/LED"
)

get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg" NAME_WE)
add_custom_target(_unitree_legged_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_legged_msgs" "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg" "unitree_legged_msgs/MotorState:unitree_legged_msgs/Cartesian:unitree_legged_msgs/IMU"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_cpp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_cpp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_cpp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_cpp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_cpp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_cpp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_cpp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_cpp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(unitree_legged_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(unitree_legged_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(unitree_legged_msgs_generate_messages unitree_legged_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_cpp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_cpp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_cpp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_cpp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_cpp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_cpp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_cpp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_cpp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_cpp _unitree_legged_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_legged_msgs_gencpp)
add_dependencies(unitree_legged_msgs_gencpp unitree_legged_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_legged_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_eus(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_eus(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_eus(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_eus(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_eus(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_eus(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_eus(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_eus(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(unitree_legged_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(unitree_legged_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(unitree_legged_msgs_generate_messages unitree_legged_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_eus _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_eus _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_eus _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_eus _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_eus _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_eus _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_eus _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_eus _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_eus _unitree_legged_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_legged_msgs_geneus)
add_dependencies(unitree_legged_msgs_geneus unitree_legged_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_legged_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_lisp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_lisp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_lisp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_lisp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_lisp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_lisp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_lisp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_lisp(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(unitree_legged_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(unitree_legged_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(unitree_legged_msgs_generate_messages unitree_legged_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_lisp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_lisp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_lisp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_lisp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_lisp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_lisp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_lisp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_lisp _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_lisp _unitree_legged_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_legged_msgs_genlisp)
add_dependencies(unitree_legged_msgs_genlisp unitree_legged_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_legged_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_nodejs(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_nodejs(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_nodejs(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_nodejs(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_nodejs(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_nodejs(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_nodejs(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_nodejs(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(unitree_legged_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(unitree_legged_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(unitree_legged_msgs_generate_messages unitree_legged_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_nodejs _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_nodejs _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_nodejs _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_nodejs _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_nodejs _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_nodejs _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_nodejs _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_nodejs _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_nodejs _unitree_legged_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_legged_msgs_gennodejs)
add_dependencies(unitree_legged_msgs_gennodejs unitree_legged_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_legged_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_py(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_py(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_py(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_py(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_py(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_py(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_py(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
)
_generate_msg_py(unitree_legged_msgs
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg;/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(unitree_legged_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(unitree_legged_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(unitree_legged_msgs_generate_messages unitree_legged_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_py _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_py _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/MotorState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_py _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_py _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/Cartesian.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_py _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LED.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_py _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_py _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/HighCmd.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_py _unitree_legged_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/ROS_ws/src/unitree_ros/unitree_legged_msgs/msg/LowState.msg" NAME_WE)
add_dependencies(unitree_legged_msgs_generate_messages_py _unitree_legged_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_legged_msgs_genpy)
add_dependencies(unitree_legged_msgs_genpy unitree_legged_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_legged_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_legged_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(unitree_legged_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(unitree_legged_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(unitree_legged_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_legged_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(unitree_legged_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(unitree_legged_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(unitree_legged_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_legged_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(unitree_legged_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(unitree_legged_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(unitree_legged_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_legged_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(unitree_legged_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(unitree_legged_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(unitree_legged_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_legged_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(unitree_legged_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(unitree_legged_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(unitree_legged_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
