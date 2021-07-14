/****************************************************************/
/*                                                              */
/*          Advanced Navigation Packet Protocol Library         */
/*          C Language Static Spatial SDK, Version 4.0          */
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

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include "an_packet_protocol.h"
#include "spatial_packets.h"
#include "spatial_data_dump.h"

#define RADIANS_TO_DEGREES (180.0/M_PI)

void an_packet_transmit(an_packet_t *an_packet)
{
	an_packet_encode(an_packet);

	/* it is up to the user to define the data transmit function which should have
	 * the prototype: send_function(uint8_t *data, int length); example usage below
	 *
	 * serial_port_transmit(an_packet_pointer(an_packet), an_packet_size(an_packet));
	 */
}

/*
 * This is an example of sending a configuration packet to Spatial.
 *
 * 1. First declare the structure for the packet, in this case sensor_ranges_packet_t.
 * 2. Set all the fields of the packet structure
 * 3. Encode the packet structure into an an_packet_t using the appropriate helper function
 * 4. Send the packet
 */
void set_sensor_ranges()
{
	an_packet_t an_packet;
	sensor_ranges_packet_t sensor_ranges_packet;

	sensor_ranges_packet.permanent = TRUE;
	sensor_ranges_packet.accelerometers_range = accelerometer_range_4g;
	sensor_ranges_packet.gyroscopes_range = gyroscope_range_500dps;
	sensor_ranges_packet.magnetometers_range = magnetometer_range_2g;

	encode_sensor_ranges_packet(&an_packet, &sensor_ranges_packet);

	an_packet_transmit(&an_packet);
}

int main()
{
	an_decoder_t an_decoder;
	an_packet_t an_packet;
	int data_count = 0;
	int bytes_to_copy;
	
	system_state_packet_t system_state_packet;
	raw_sensors_packet_t raw_sensors_packet;
	
	an_decoder_initialise(&an_decoder);
	
	/* iterate through an example data dump from spatial */
	while(data_count < sizeof(spatial_data_dump))
	{
		/* calculate the number of bytes to copy */
		bytes_to_copy = an_decoder_size(&an_decoder);
		if(bytes_to_copy > sizeof(spatial_data_dump) - data_count) bytes_to_copy = sizeof(spatial_data_dump) - data_count;
		
		/* fill the decode buffer with the data */
		memcpy(an_decoder_pointer(&an_decoder), &spatial_data_dump[data_count], bytes_to_copy*sizeof(uint8_t));
		an_decoder_increment(&an_decoder, bytes_to_copy);
		
		/* increase the iterator by the number of bytes copied */
		data_count += bytes_to_copy;
		
		/* decode all packets in the internal buffer */
		while(an_packet_decode(&an_decoder, &an_packet))
		{
			if(an_packet.id == packet_id_system_state) /* system state packet */
			{
				/* copy all the binary data into the typedef struct for the packet */
				/* this allows easy access to all the different values             */
				if(decode_system_state_packet(&system_state_packet, &an_packet) == 0)
				{
					printf("System State Packet:\n");
					printf("\tLatitude = %f, Longitude = %f, Height = %f\n", system_state_packet.latitude * RADIANS_TO_DEGREES, system_state_packet.longitude * RADIANS_TO_DEGREES, system_state_packet.height);
					printf("\tRoll = %f, Pitch = %f, Heading = %f\n", system_state_packet.orientation[0] * RADIANS_TO_DEGREES, system_state_packet.orientation[1] * RADIANS_TO_DEGREES, system_state_packet.orientation[2] * RADIANS_TO_DEGREES);
				}
			}
			else if(an_packet.id == packet_id_raw_sensors) /* raw sensors packet */
			{
				/* copy all the binary data into the typedef struct for the packet */
				/* this allows easy access to all the different values             */
				if(decode_raw_sensors_packet(&raw_sensors_packet, &an_packet) == 0)
				{
					printf("Raw Sensors Packet:\n");
					printf("\tAccelerometers X: %f Y: %f Z: %f\n", raw_sensors_packet.accelerometers[0], raw_sensors_packet.accelerometers[1], raw_sensors_packet.accelerometers[2]);
					printf("\tGyroscopes X: %f Y: %f Z: %f\n", raw_sensors_packet.gyroscopes[0] * RADIANS_TO_DEGREES, raw_sensors_packet.gyroscopes[1] * RADIANS_TO_DEGREES, raw_sensors_packet.gyroscopes[2] * RADIANS_TO_DEGREES);
				}
			}
			else
			{		
				printf("Packet ID %u of Length %u\n", an_packet.id, an_packet.length);
			}
		}
	}
	
	return EXIT_SUCCESS;
}
