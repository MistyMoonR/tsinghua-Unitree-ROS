# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ros/ROS_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ros/ROS_ws/build

# Include any dependencies generated for this target.
include unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/depend.make

# Include the progress variables for this target.
include unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/progress.make

# Include the compile flags for this target's objects.
include unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/flags.make

unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o: unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/flags.make
unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o: /home/ros/ROS_ws/src/unitree_ros/unitree_legged_real/src/exe/velocity_mode.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ros/ROS_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o"
	cd /home/ros/ROS_ws/build/unitree_ros/unitree_legged_real && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o -c /home/ros/ROS_ws/src/unitree_ros/unitree_legged_real/src/exe/velocity_mode.cpp

unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.i"
	cd /home/ros/ROS_ws/build/unitree_ros/unitree_legged_real && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ros/ROS_ws/src/unitree_ros/unitree_legged_real/src/exe/velocity_mode.cpp > CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.i

unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.s"
	cd /home/ros/ROS_ws/build/unitree_ros/unitree_legged_real && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ros/ROS_ws/src/unitree_ros/unitree_legged_real/src/exe/velocity_mode.cpp -o CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.s

unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o.requires:

.PHONY : unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o.requires

unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o.provides: unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o.requires
	$(MAKE) -f unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/build.make unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o.provides.build
.PHONY : unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o.provides

unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o.provides.build: unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o


# Object files for target velocity_lcm
velocity_lcm_OBJECTS = \
"CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o"

# External object files for target velocity_lcm
velocity_lcm_EXTERNAL_OBJECTS =

/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/build.make
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /opt/ros/melodic/lib/libroscpp.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /opt/ros/melodic/lib/librosconsole.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /opt/ros/melodic/lib/librostime.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /opt/ros/melodic/lib/libcpp_common.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm: unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ros/ROS_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm"
	cd /home/ros/ROS_ws/build/unitree_ros/unitree_legged_real && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/velocity_lcm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/build: /home/ros/ROS_ws/devel/lib/unitree_legged_real/velocity_lcm

.PHONY : unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/build

unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/requires: unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/src/exe/velocity_mode.cpp.o.requires

.PHONY : unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/requires

unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/clean:
	cd /home/ros/ROS_ws/build/unitree_ros/unitree_legged_real && $(CMAKE_COMMAND) -P CMakeFiles/velocity_lcm.dir/cmake_clean.cmake
.PHONY : unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/clean

unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/depend:
	cd /home/ros/ROS_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ros/ROS_ws/src /home/ros/ROS_ws/src/unitree_ros/unitree_legged_real /home/ros/ROS_ws/build /home/ros/ROS_ws/build/unitree_ros/unitree_legged_real /home/ros/ROS_ws/build/unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unitree_ros/unitree_legged_real/CMakeFiles/velocity_lcm.dir/depend
