all: packet_example

packet_example: rs232/rs232.c rs232/rs232.h packet_example.c
	gcc -pedantic -Wall -o packet_example rs232/rs232.c packet_example.c
	
clean:
	rm packet_example
