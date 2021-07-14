/****************************************************************/
/*                                                              */
/*          Advanced Navigation Packet Protocol Library         */
/*          C Language Dynamic Spatial SDK, Version 4.0         */
/*   Copyright 2014, Xavier Orr, Advanced Navigation Pty Ltd    */
/*                                                              */
/****************************************************************/
/*
 * Copyright (C) 2014 Advanced Navigation Pty Ltd
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

#include "../../C/Dynamic/an_packet_protocol.h"
#include "../../C/Dynamic/spatial_packets.h"

#define RADIANS_TO_DEGREES (180.0/M_PI)

int main(int argc, char *argv[])
{
	an_decoder_t an_decoder;
	an_packet_t *an_packet;
	
	system_state_packet_t system_state_packet;
	raw_sensors_packet_t raw_sensors_packet;
	
	FILE *log_file;

	int bytes_read;

	if (argc != 2)
	{
		printf("Usage - program log_file.anpp\nExample - packet_example.exe SpatialLog.anpp\n");
		exit(EXIT_FAILURE);
	}

	log_file = fopen(argv[1], "rb");
	
	if (log_file == NULL)
	{
		printf("Error opening log file\n");
		exit(EXIT_FAILURE);
	}
	
	an_decoder_initialise(&an_decoder);

	while ((bytes_read = fread(an_decoder_pointer(&an_decoder), sizeof(uint8_t), an_decoder_size(&an_decoder), log_file)) > 0)
	{
		/* increment the decode buffer length by the number of bytes received */
		an_decoder_increment(&an_decoder, bytes_read);

		/* decode all the packets in the buffer */
		while ((an_packet = an_packet_decode(&an_decoder)) != NULL)
		{
			if (an_packet->id == packet_id_system_state) /* system state packet */
			{
				/* copy all the binary data into the typedef struct for the packet */
				/* this allows easy access to all the different values             */
				if (decode_system_state_packet(&system_state_packet, an_packet) == 0)
				{
					printf("System State Packet:\n");
					printf("\tLatitude = %f, Longitude = %f, Height = %f\n", system_state_packet.latitude * RADIANS_TO_DEGREES, system_state_packet.longitude * RADIANS_TO_DEGREES, system_state_packet.height);
					printf("\tRoll = %f, Pitch = %f, Yaw = %f\n", system_state_packet.orientation[0] * RADIANS_TO_DEGREES, system_state_packet.orientation[1] * RADIANS_TO_DEGREES, system_state_packet.orientation[2] * RADIANS_TO_DEGREES);
				}
			}
			else if (an_packet->id == packet_id_raw_sensors) /* raw sensors packet */
			{
				/* copy all the binary data into the typedef struct for the packet */
				/* this allows easy access to all the different values             */
				if (decode_raw_sensors_packet(&raw_sensors_packet, an_packet) == 0)
				{
					printf("Raw Sensors Packet:\n");
					printf("\tAccelerometers X: %f Y: %f Z: %f\n", raw_sensors_packet.accelerometers[0], raw_sensors_packet.accelerometers[1], raw_sensors_packet.accelerometers[2]);
					printf("\tGyroscopes X: %f Y: %f Z: %f\n", raw_sensors_packet.gyroscopes[0] * RADIANS_TO_DEGREES, raw_sensors_packet.gyroscopes[1] * RADIANS_TO_DEGREES, raw_sensors_packet.gyroscopes[2] * RADIANS_TO_DEGREES);
				}
			}
			else
			{
				printf("Packet ID %u of Length %u\n", an_packet->id, an_packet->length);
			}

			/* Ensure that you free the an_packet when your done with it or you will leak memory */
			an_packet_free(&an_packet);
		}
	}
	return EXIT_SUCCESS;
}
