Advanced Navigation Packet Protocol Spatial SDK Version 4.0
C Language SDK

******************
**** EXAMPLES ****
******************

Dynamic:
	Uses dynamic memory allocation (malloc) and should be used in most cases.
	The example code connects to Spatial through the serial port and decodes data in real time. Does not work on Mac systems.

Static:
	Does not use dynamic memory allocation and should be used on embedded systems that do not have dynamic memory allocation available.
	The example code decodes a data dump from Spatial.

*******************
**** COMPILING ****
*******************

Windows:
	1. Install MinGW
	2. Open a command prompt
	3. Navigate to the directory with the makefile
	4. Type mingw32-make
	5. Type packet_example.exe
	
Linux:
	1. Open a terminal
	2. Navigate to the directory with the makefile
	3. Type make
	4. Type ./packet_example
	
*******************
**** CHANGELOG ****
*******************

v4.0:
    Updated GNSS receiver packet in spatial_packets.c and spatial_packets.h
	Changed NMEA configuration packet to GPIO configuration packet in spatial_packets.c and spatial_packets.h
	Updated dual antenna configuration packet in spatial_packets.c and spatial_packets.h
	Updated zero alignment packet in spatial_packets.c and spatial_packets.h
	Added odometer packet to spatial_packets.c and spatial_packets.h
	Added external air data packet to spatial_packets.c and spatial_packets.h
	Added GNSS receiver information packet to spatial_packets.c and spatial_packets.h
	RS232 library updated to use serial port path name instead of index
v3.0:
	No changes
v2.3:
	Added C++ extern declarations in header files
	Added malloc failure tolerance in dynamic example spatial_packets.c
	Added external pitot pressure packet to spatial_packets.c and spatial_packets.h
	Added wind estimation packet to spatial_packets.c and spatial_packets.h
	Added heave packet to spatial_packets.c and spatial_packets.h
	Added heave offset packet to spatial_packets.c and spatial_packets.h
v2.2:
	Removed reserved fields from typedef structs
	Added external time packet to spatial_packets.c and spatial_packets.h
	Added external depth packet to spatial_packets.c and spatial_packets.h
	Added geoid height packet to spatial_packets.c and spatial_packets.h
v2.1:
	No changes
v2.0:
	Removed packet_example.h
	Added additional acknowledge responses to spatial_packets.h
	Added running time packet to spatial_packets.c and spatial_packets.h
	Added local magnetic field packet to spatial_packets.c and spatial_packets.h
	Added odometer state packet to spatial_packets.c and spatial_packets.h
	Alignment packet modified in spatial_packets.c and spatial_packets.h
	Added additional GPIO functions to spatial_packets.h
	Added odometer configuration packet to spatial_packets.c and spatial_packets.h
	Added zero orientation alignment packet to spatial_packets.c and spatial_packets.h
v1.1:
	spatial_packets.c and spatial_packets.h now contain decode and encode functions for all current packets
v1.0:
	Added spatial_packets.c and spatial_packets.h
v0.5:
	No changes
v0.2:
	Complete overhaul
v0.1:
	First Release
