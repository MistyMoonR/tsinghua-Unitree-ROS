all: anpp_log_decoder

anpp_log_decoder: ../../C/Dynamic/an_packet_protocol.c ../../C/Dynamic/an_packet_protocol.h ../../C/Dynamic/spatial_packets.c ../../C/Dynamic/spatial_packets.h anpp_log_decoder.c
	gcc -pedantic -Wall -o anpp_log_decoder ../../C/Dynamic/an_packet_protocol.c ../../C/Dynamic/spatial_packets.c anpp_log_decoder.c
	
clean:
	rm anpp_log_decoder
