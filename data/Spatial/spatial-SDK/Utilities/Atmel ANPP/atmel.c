/****************************************************************/
/*                                                              */
/*      Advanced Navigation Packet Protocol Library             */
/*           Atmel AVR Conversion, Version 4.0                  */
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
 
 #include <stdint.h>
 #include <string.h>
 #include <math.h>
 #include "an_packet_protocol.h"
 #include "spatial_packets.h"

/*
 * Advanced Navigation strongly recommends against the use of Atmel AVR devices
 * with Spatial. However we do acknowledge that they are a good learning tool and
 * that they are widely used throughout universities and hobby robotics. The
 * main disadvantages with AVR devices are their lack of support for double precision
 * floating point and their limited processing power. This library allows AVR devices
 * to communicate with Spatial by converting the double precision floating point that
 * Spatial uses to single precision floating point. Please note that this degrades the
 * position resolution down to between 0.1 - 0.3 metres depending on the geographical
 * location. We highly advise switching to an ARM based processor in the long term.
 *
 * To Use:
 * 1. Add the function fp64_to_fp32() to the top of the spatial_packets.c file
 * 2. Replace the decode functions in spatial_packets.c with the ones in this file.
 *    (Do not remove all the decode functions in spatial_packets.c, only those below)
 */

float fp64_to_fp32(uint8_t *bytes)
{
	float result;
	int32_t exponent;
	uint32_t high_mantissa, low_mantissa;
    
	memcpy(&low_mantissa, &bytes[0], sizeof(uint32_t));
	memcpy(&high_mantissa, &bytes[4], sizeof(uint32_t));
    high_mantissa &= 0x000FFFFF;
	exponent = ((bytes[7] & 0x7F) << 4) | (bytes[6] >> 4);
    
	if (exponent == 0 && high_mantissa == 0 && low_mantissa == 0)
	{
		result = 0;
	}
	else
	{        
        if (exponent == 0x7FF)
        {
			result = NAN;
		}
		else 
        {
			if (exponent == 0)
            {
                exponent = -(1023 + 19);
			}
			else
            {
				high_mantissa += 0x00100000;
                exponent -= (1023 + 20);
			}
            result = ldexp(high_mantissa, exponent);
            result += ldexp(low_mantissa, exponent - 32);
		}
	}
    
	if (bytes[7] & 0x80) return -result;
	else return result;
}
 
int decode_system_state_packet(system_state_packet_t *system_state_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_system_state && an_packet->length == 100)
	{
		memcpy(&system_state_packet->system_status, &an_packet->data[0], sizeof(uint16_t));
		memcpy(&system_state_packet->filter_status, &an_packet->data[2], sizeof(uint16_t));
		memcpy(&system_state_packet->unix_time_seconds, &an_packet->data[4], sizeof(uint32_t));
		memcpy(&system_state_packet->microseconds, &an_packet->data[8], sizeof(uint32_t));
		system_state_packet->latitude = fp64_to_fp32(&an_packet->data[12]);
		system_state_packet->longitude = fp64_to_fp32(&an_packet->data[20]);
		system_state_packet->height = fp64_to_fp32(&an_packet->data[28]);
		memcpy(&system_state_packet->velocity[0], &an_packet->data[36], 3 * sizeof(float));
		memcpy(&system_state_packet->body_acceleration[0], &an_packet->data[48], 3 * sizeof(float));
		memcpy(&system_state_packet->g_force, &an_packet->data[60], sizeof(float));
		memcpy(&system_state_packet->orientation[0], &an_packet->data[64], 3 * sizeof(float));
		memcpy(&system_state_packet->angular_velocity[0], &an_packet->data[76], 3 * sizeof(float));
		memcpy(&system_state_packet->standard_deviation[0], &an_packet->data[88], 3 * sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_raw_gnss_packet(raw_gnss_packet_t *raw_gnss_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_raw_gnss && an_packet->length == 36)
	{
		raw_gnss_packet->position[0] = fp64_to_fp32(&an_packet->data[0]);
		raw_gnss_packet->position[1] = fp64_to_fp32(&an_packet->data[8]);
		raw_gnss_packet->position[2] = fp64_to_fp32(&an_packet->data[16]);
		memcpy(&raw_gnss_packet->velocity[0], &an_packet->data[24], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_geodetic_position_packet(geodetic_position_packet_t *geodetic_position_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_geodetic_position && an_packet->length == 24)
	{
		geodetic_position_packet->position[0] = fp64_to_fp32(&an_packet->data[0]);
		geodetic_position_packet->position[1] = fp64_to_fp32(&an_packet->data[8]);
		geodetic_position_packet->position[2] = fp64_to_fp32(&an_packet->data[16]);
		return 0;
	}
	else return 1;
}

int decode_ecef_position_packet(ecef_position_packet_t *ecef_position_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_ecef_position && an_packet->length == 24)
	{
		ecef_position_packet->position[0] = fp64_to_fp32(&an_packet->data[0]);
		ecef_position_packet->position[1] = fp64_to_fp32(&an_packet->data[8]);
		ecef_position_packet->position[2] = fp64_to_fp32(&an_packet->data[16]);
		return 0;
	}
	else return 1;
}

int decode_utm_position_packet(utm_position_packet_t *utm_position_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_utm_position && an_packet->length == 25)
	{
		utm_position_packet->position[0] = fp64_to_fp32(&an_packet->data[0]);
		utm_position_packet->position[1] = fp64_to_fp32(&an_packet->data[8]);
		utm_position_packet->position[2] = fp64_to_fp32(&an_packet->data[16]);
		utm_position_packet->zone = an_packet->data[24];
		return 0;
	}
	else return 1;
}