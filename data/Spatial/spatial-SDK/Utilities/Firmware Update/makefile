all: firmware_update

firmware_update: ../../C/Dynamic/an_packet_protocol.c ../../C/Dynamic/an_packet_protocol.h ../../C/Dynamic/spatial_packets.c ../../C/Dynamic/spatial_packets.h ../../C/Dynamic/rs232/rs232.c ../../C/Dynamic/rs232/rs232.h firmware_update.c
	gcc -pedantic -Wall -o firmware_update ../../C/Dynamic/an_packet_protocol.c ../../C/Dynamic/spatial_packets.c ../../C/Dynamic/rs232/rs232.c firmware_update.c
	
clean:
	rm firmware_update
