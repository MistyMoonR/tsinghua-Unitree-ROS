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
 
 #include <stdint.h>
 #include <string.h>
 #include "an_packet_protocol.h"
 #include "spatial_packets.h"

/*
 * This file contains functions to decode and encode packets
 *
 * Decode functions take an an_packet_t and turn it into a type specific
 * to that packet so that the fields can be conveniently accessed. Decode
 * functions return 0 for success and 1 for failure. Decode functions are
 * used when receiving packets.
 *
 * Example decode
 *
 * an_packet_t an_packet
 * acknowledge_packet_t acknowledge_packet
 * ...
 * decode_acknowledge_packet(&acknowledge_packet, &an_packet);
 * printf("acknowledge id %d with result %d\n", acknowledge_packet.packet_id, acknowledge_packet.acknowledge_result);
 *
 * Encode functions take a type specific structure and turn it into an
 * an_packet_t. Encode functions are used when sending packets. Don't
 * forget to free the returned packet with an_packet_free().
 *
 * Example encode
 *
 * an_packet_t *an_packet;
 * boot_mode_packet_t boot_mode_packet;
 * ...
 * boot_mode_packet.boot_mode = boot_mode_bootloader;
 * an_packet = encode_boot_mode_packet(&boot_mode_packet);
 * serial_port_transmit(an_packet_pointer(an_packet), an_packet_size(an_packet));
 * an_packet_free(&an_packet);
 *
 */

int decode_acknowledge_packet(acknowledge_packet_t *acknowledge_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_acknowledge && an_packet->length == 4)
	{
		acknowledge_packet->packet_id = an_packet->data[0];
		memcpy(&acknowledge_packet->packet_crc, &an_packet->data[1], sizeof(uint16_t));
		acknowledge_packet->acknowledge_result = an_packet->data[3];
		return 0;
	}
	else return 1;
}

an_packet_t *encode_request_packet(uint8_t requested_packet_id)
{
	an_packet_t *an_packet = an_packet_allocate(1, packet_id_request);
	an_packet->data[0] = requested_packet_id;
	return an_packet;
}

int decode_boot_mode_packet(boot_mode_packet_t *boot_mode_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_boot_mode && an_packet->length == 1)
	{
		boot_mode_packet->boot_mode = an_packet->data[0];
		return 0;
	}
	else return 1;
}

an_packet_t *encode_boot_mode_packet(boot_mode_packet_t *boot_mode_packet)
{
	an_packet_t *an_packet = an_packet_allocate(1, packet_id_boot_mode);
	an_packet->data[0] = boot_mode_packet->boot_mode;
	return an_packet;
}

int decode_device_information_packet(device_information_packet_t *device_information_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_device_information && an_packet->length == 24)
	{
		memcpy(&device_information_packet->software_version, &an_packet->data[0], sizeof(uint32_t));
		memcpy(&device_information_packet->device_id, &an_packet->data[4], sizeof(uint32_t));
		memcpy(&device_information_packet->hardware_revision, &an_packet->data[8], sizeof(uint32_t));
		memcpy(&device_information_packet->serial_number[0], &an_packet->data[12], 3*sizeof(uint32_t));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_restore_factory_settings_packet()
{
	uint32_t verification = 0x85429E1C;
	an_packet_t *an_packet = an_packet_allocate(4, packet_id_restore_factory_settings);
	memcpy(&an_packet->data[0], &verification, sizeof(uint32_t));
	return an_packet;
}

an_packet_t *encode_reset_packet()
{
	uint32_t verification = 0x21057A7E;
	an_packet_t *an_packet = an_packet_allocate(4, packet_id_reset);
	memcpy(&an_packet->data[0], &verification, sizeof(uint32_t));
	return an_packet;
}

int decode_file_transfer_acknowledge_packet(file_transfer_acknowledge_packet_t *file_transfer_acknowledge_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_file_transfer_acknowledge && an_packet->length == 9)
	{
		memcpy(&file_transfer_acknowledge_packet->unique_id, &an_packet->data[0], sizeof(uint32_t));
		memcpy(&file_transfer_acknowledge_packet->data_index, &an_packet->data[4], sizeof(uint32_t));
		file_transfer_acknowledge_packet->response_code = an_packet->data[8];
		return 0;
	}
	else return 1;
}
 
int decode_system_state_packet(system_state_packet_t *system_state_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_system_state && an_packet->length == 100)
	{
		memcpy(&system_state_packet->system_status, &an_packet->data[0], sizeof(uint16_t));
		memcpy(&system_state_packet->filter_status, &an_packet->data[2], sizeof(uint16_t));
		memcpy(&system_state_packet->unix_time_seconds, &an_packet->data[4], sizeof(uint32_t));
		memcpy(&system_state_packet->microseconds, &an_packet->data[8], sizeof(uint32_t));
		memcpy(&system_state_packet->latitude, &an_packet->data[12], sizeof(double));
		memcpy(&system_state_packet->longitude, &an_packet->data[20], sizeof(double));
		memcpy(&system_state_packet->height, &an_packet->data[28], sizeof(double));
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

int decode_unix_time_packet(unix_time_packet_t *unix_time_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_unix_time && an_packet->length == 8)
	{
		memcpy(&unix_time_packet->unix_time_seconds, &an_packet->data[0], sizeof(uint32_t));
		memcpy(&unix_time_packet->microseconds, &an_packet->data[4], sizeof(uint32_t));
		return 0;
	}
	else return 1;
}

int decode_formatted_time_packet(formatted_time_packet_t *formatted_time_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_formatted_time && an_packet->length == 14)
	{
		memcpy(&formatted_time_packet->microseconds, &an_packet->data[0], sizeof(uint32_t));
		memcpy(&formatted_time_packet->year, &an_packet->data[4], sizeof(uint16_t));
		memcpy(&formatted_time_packet->year_day, &an_packet->data[6], sizeof(uint16_t));
		formatted_time_packet->month = an_packet->data[8];
		formatted_time_packet->month_day = an_packet->data[9];
		formatted_time_packet->week_day = an_packet->data[10];
		formatted_time_packet->hour = an_packet->data[11];
		formatted_time_packet->minute = an_packet->data[12];
		formatted_time_packet->second = an_packet->data[13];
		return 0;
	}
	else return 1;
}

int decode_status_packet(status_packet_t *status_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_status && an_packet->length == 4)
	{
		memcpy(&status_packet->system_status, &an_packet->data[0], sizeof(uint16_t));
		memcpy(&status_packet->filter_status, &an_packet->data[2], sizeof(uint16_t));
		return 0;
	}
	else return 1;
}

int decode_position_standard_deviation_packet(position_standard_deviation_packet_t *position_standard_deviation_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_position_standard_deviation && an_packet->length == 12)
	{
		memcpy(&position_standard_deviation_packet->standard_deviation[0], &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_velocity_standard_deviation_packet(velocity_standard_deviation_packet_t *velocity_standard_deviation_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_velocity_standard_deviation && an_packet->length == 12)
	{
		memcpy(&velocity_standard_deviation_packet->standard_deviation[0], &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_euler_orientation_standard_deviation_packet(euler_orientation_standard_deviation_packet_t *euler_orientation_standard_deviation, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_euler_orientation_standard_deviation && an_packet->length == 12)
	{
		memcpy(&euler_orientation_standard_deviation->standard_deviation[0], &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_quaternion_orientation_standard_deviation_packet(quaternion_orientation_standard_deviation_packet_t *quaternion_orientation_standard_deviation_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_quaternion_orientation_standard_deviation && an_packet->length == 16)
	{
		memcpy(&quaternion_orientation_standard_deviation_packet->standard_deviation[0], &an_packet->data[0], 4*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_raw_sensors_packet(raw_sensors_packet_t *raw_sensors_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_raw_sensors && an_packet->length == 48)
	{
		memcpy(&raw_sensors_packet->accelerometers[0], &an_packet->data[0], 3 * sizeof(float));
		memcpy(&raw_sensors_packet->gyroscopes[0], &an_packet->data[12], 3 * sizeof(float));
		memcpy(&raw_sensors_packet->magnetometers[0], &an_packet->data[24], 3 * sizeof(float));
		memcpy(&raw_sensors_packet->imu_temperature, &an_packet->data[36], sizeof(float));
		memcpy(&raw_sensors_packet->pressure, &an_packet->data[40], sizeof(float));
		memcpy(&raw_sensors_packet->pressure_temperature, &an_packet->data[44], sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_raw_gnss_packet(raw_gnss_packet_t *raw_gnss_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_raw_gnss && an_packet->length == 74)
	{
		memcpy(&raw_gnss_packet->unix_time_seconds, &an_packet->data[0], sizeof(uint32_t));
		memcpy(&raw_gnss_packet->microseconds, &an_packet->data[4], sizeof(uint32_t));
		memcpy(&raw_gnss_packet->position[0], &an_packet->data[8], 3*sizeof(double));
		memcpy(&raw_gnss_packet->velocity[0], &an_packet->data[32], 3*sizeof(float));
		memcpy(&raw_gnss_packet->position_standard_deviation[0], &an_packet->data[44], 3*sizeof(float));
		memcpy(&raw_gnss_packet->tilt, &an_packet->data[56], sizeof(float));
		memcpy(&raw_gnss_packet->heading, &an_packet->data[60], sizeof(float));
		memcpy(&raw_gnss_packet->tilt_standard_deviation, &an_packet->data[64], sizeof(float));
		memcpy(&raw_gnss_packet->heading_standard_deviation, &an_packet->data[68], sizeof(float));
		memcpy(&raw_gnss_packet->flags.r, &an_packet->data[72], sizeof(uint16_t));
		return 0;
	}
	else return 1;
}

int decode_satellites_packet(satellites_packet_t *satellites_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_satellites && an_packet->length == 13)
	{
		memcpy(&satellites_packet->hdop, &an_packet->data[0], sizeof(float));
		memcpy(&satellites_packet->vdop, &an_packet->data[4], sizeof(float));
		memcpy(&satellites_packet->gps_satellites, &an_packet->data[8], 5*sizeof(uint8_t));
		return 0;
	}
	else return 1;
}

int decode_detailed_satellites_packet(detailed_satellites_packet_t *detailed_satellites_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_satellites_detailed && (an_packet->length % 7) == 0)
	{
		int number_of_satellites = an_packet->length / 7;
		int i;
		for(i = 0; i < MAXIMUM_DETAILED_SATELLITES; i++)
		{
			if(i < number_of_satellites)
			{
				detailed_satellites_packet->satellites[i].satellite_system = an_packet->data[7*i];
				detailed_satellites_packet->satellites[i].number = an_packet->data[7*i + 1];
				detailed_satellites_packet->satellites[i].frequencies.r = an_packet->data[7*i + 2];
				detailed_satellites_packet->satellites[i].elevation = an_packet->data[7*i + 3];
				memcpy(&detailed_satellites_packet->satellites[i].azimuth, &an_packet->data[7*i + 4], sizeof(uint16_t));
				detailed_satellites_packet->satellites[i].snr = an_packet->data[7*i + 6];
			}
			else memset(&detailed_satellites_packet->satellites[i], 0, sizeof(satellite_t));
		}
		return 0;
	}
	else return 1;
}

int decode_geodetic_position_packet(geodetic_position_packet_t *geodetic_position_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_geodetic_position && an_packet->length == 24)
	{
		memcpy(&geodetic_position_packet->position[0], &an_packet->data[0], 3*sizeof(double));
		return 0;
	}
	else return 1;
}

int decode_ecef_position_packet(ecef_position_packet_t *ecef_position_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_ecef_position && an_packet->length == 24)
	{
		memcpy(&ecef_position_packet->position[0], &an_packet->data[0], 3*sizeof(double));
		return 0;
	}
	else return 1;
}

int decode_utm_position_packet(utm_position_packet_t *utm_position_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_utm_position && an_packet->length == 25)
	{
		memcpy(&utm_position_packet->position, &an_packet->data[0], 3*sizeof(double));
		utm_position_packet->zone = an_packet->data[24];
		return 0;
	}
	else return 1;
}

int decode_ned_velocity_packet(ned_velocity_packet_t *ned_velocity_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_ned_velocity && an_packet->length == 12)
	{
		memcpy(&ned_velocity_packet->velocity, &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_body_velocity_packet(body_velocity_packet_t *body_velocity_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_body_velocity && an_packet->length == 12)
	{
		memcpy(&body_velocity_packet->velocity, &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_acceleration_packet(acceleration_packet_t *acceleration, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_acceleration && an_packet->length == 12)
	{
		memcpy(&acceleration->acceleration[0], &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_body_acceleration_packet(body_acceleration_packet_t *body_acceleration, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_body_acceleration && an_packet->length == 16)
	{
		memcpy(&body_acceleration->acceleration[0], &an_packet->data[0], 3*sizeof(float));
		memcpy(&body_acceleration->g_force, &an_packet->data[12], sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_euler_orientation_packet(euler_orientation_packet_t *euler_orientation_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_euler_orientation && an_packet->length == 12)
	{
		memcpy(&euler_orientation_packet->orientation[0], &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_quaternion_orientation_packet(quaternion_orientation_packet_t *quaternion_orientation_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_quaternion_orientation && an_packet->length == 16)
	{
		memcpy(&quaternion_orientation_packet->orientation[0], &an_packet->data[0], 4*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_dcm_orientation_packet(dcm_orientation_packet_t *dcm_orientation_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_dcm_orientation && an_packet->length == 36)
	{
		memcpy(&dcm_orientation_packet->orientation[0][0], &an_packet->data[0], 9*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_angular_velocity_packet(angular_velocity_packet_t *angular_velocity_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_angular_velocity && an_packet->length == 12)
	{
		memcpy(&angular_velocity_packet->angular_velocity[0], &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_angular_acceleration_packet(angular_acceleration_packet_t *angular_acceleration_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_angular_acceleration && an_packet->length == 12)
	{
		memcpy(&angular_acceleration_packet->angular_acceleration[0], &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_external_position_velocity_packet(external_position_velocity_packet_t *external_position_velocity_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_position_velocity && an_packet->length == 60)
	{
		memcpy(&external_position_velocity_packet->position[0], &an_packet->data[0], 3*sizeof(double));
		memcpy(&external_position_velocity_packet->velocity[0], &an_packet->data[24], 3*sizeof(float));
		memcpy(&external_position_velocity_packet->position_standard_deviation[0], &an_packet->data[36], 3*sizeof(float));
		memcpy(&external_position_velocity_packet->velocity_standard_deviation[0], &an_packet->data[48], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_position_velocity_packet(external_position_velocity_packet_t *external_position_velocity_packet)
{
	an_packet_t *an_packet = an_packet_allocate(60, packet_id_external_position_velocity);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_position_velocity_packet->position[0], 3*sizeof(double));
		memcpy(&an_packet->data[24], &external_position_velocity_packet->velocity[0], 3*sizeof(float));
		memcpy(&an_packet->data[36], &external_position_velocity_packet->position_standard_deviation[0], 3*sizeof(float));
		memcpy(&an_packet->data[48], &external_position_velocity_packet->velocity_standard_deviation[0], 3*sizeof(float));
	}
	return an_packet;
}

int decode_external_position_packet(external_position_packet_t *external_position_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_position && an_packet->length == 36)
	{
		memcpy(&external_position_packet->position[0], &an_packet->data[0], 3*sizeof(double));
		memcpy(&external_position_packet->standard_deviation[0], &an_packet->data[24], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_position_packet(external_position_packet_t *external_position_packet)
{
	an_packet_t *an_packet = an_packet_allocate(36, packet_id_external_position);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_position_packet->position[0], 3*sizeof(double));
		memcpy(&an_packet->data[24], &external_position_packet->standard_deviation[0], 3*sizeof(float));
	}
	return an_packet;
}

int decode_external_velocity_packet(external_velocity_packet_t *external_velocity_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_velocity && an_packet->length == 24)
	{
		memcpy(&external_velocity_packet->velocity[0], &an_packet->data[0], 3*sizeof(float));
		memcpy(&external_velocity_packet->standard_deviation[0], &an_packet->data[12], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_velocity_packet(external_velocity_packet_t *external_velocity_packet)
{
	an_packet_t *an_packet = an_packet_allocate(24, packet_id_external_velocity);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_velocity_packet->velocity[0], 3*sizeof(float));
		memcpy(&an_packet->data[12], &external_velocity_packet->standard_deviation[0], 3*sizeof(float));
	}
	return an_packet;
}

int decode_external_body_velocity_packet(external_body_velocity_packet_t *external_body_velocity_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_body_velocity && an_packet->length == 16)
	{
		memcpy(&external_body_velocity_packet->velocity, &an_packet->data[0], 3*sizeof(float));
		memcpy(&external_body_velocity_packet->standard_deviation, &an_packet->data[12], sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_body_velocity_packet(external_body_velocity_packet_t *external_body_velocity_packet)
{
	an_packet_t *an_packet = an_packet_allocate(16, packet_id_external_body_velocity);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_body_velocity_packet->velocity[0], 3*sizeof(float));
		memcpy(&an_packet->data[12], &external_body_velocity_packet->standard_deviation, sizeof(float));
	}
	return an_packet;
}

int decode_external_heading_packet(external_heading_packet_t *external_heading_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_heading && an_packet->length == 8)
	{
		memcpy(&external_heading_packet->heading, &an_packet->data[0], sizeof(float));
		memcpy(&external_heading_packet->standard_deviation, &an_packet->data[4], sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_heading_packet(external_heading_packet_t *external_heading_packet)
{
	an_packet_t *an_packet = an_packet_allocate(8, packet_id_external_heading);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_heading_packet->heading, sizeof(float));
		memcpy(&an_packet->data[4], &external_heading_packet->standard_deviation, sizeof(float));
	}
	return an_packet;
}

int decode_running_time_packet(running_time_packet_t *running_time_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_running_time && an_packet->length == 8)
	{
		memcpy(&running_time_packet->seconds, &an_packet->data[0], sizeof(uint32_t));
		memcpy(&running_time_packet->microseconds, &an_packet->data[4], sizeof(uint32_t));
		return 0;
	}
	else return 1;
}

int decode_local_magnetics_packet(local_magnetics_packet_t *local_magnetics_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_local_magnetics && an_packet->length == 12)
	{
		memcpy(&local_magnetics_packet->magnetic_field[0], &an_packet->data[0], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_odometer_state_packet(odometer_state_packet_t *odometer_state_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_odometer_state && an_packet->length == 20)
	{
		memcpy(&odometer_state_packet->pulse_count, &an_packet->data[0], sizeof(uint32_t));
		memcpy(&odometer_state_packet->distance, &an_packet->data[4], sizeof(float));
		memcpy(&odometer_state_packet->speed, &an_packet->data[8], sizeof(float));
		memcpy(&odometer_state_packet->slip, &an_packet->data[12], sizeof(float));
		odometer_state_packet->active = an_packet->data[16];
		return 0;
	}
	else return 1;
}

int decode_external_time_packet(external_time_packet_t *external_time_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_time && an_packet->length == 8)
	{
		memcpy(&external_time_packet->unix_time_seconds, &an_packet->data[0], sizeof(float));
		memcpy(&external_time_packet->microseconds, &an_packet->data[4], sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_time_packet(external_time_packet_t *external_time_packet)
{
	an_packet_t *an_packet = an_packet_allocate(8, packet_id_external_time);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_time_packet->unix_time_seconds, sizeof(float));
		memcpy(&an_packet->data[4], &external_time_packet->microseconds, sizeof(float));
	}
	return an_packet;
}

int decode_external_depth_packet(external_depth_packet_t *external_depth_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_depth && an_packet->length == 8)
	{
		memcpy(&external_depth_packet->depth, &an_packet->data[0], sizeof(float));
		memcpy(&external_depth_packet->standard_deviation, &an_packet->data[4], sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_depth_packet(external_depth_packet_t *external_depth_packet)
{
	an_packet_t *an_packet = an_packet_allocate(8, packet_id_external_depth);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_depth_packet->depth, sizeof(float));
		memcpy(&an_packet->data[4], &external_depth_packet->standard_deviation, sizeof(float));
	}
	return an_packet;
}

int decode_geoid_height_packet(geoid_height_packet_t *geoid_height_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_geoid_height && an_packet->length == 4)
	{
		memcpy(&geoid_height_packet->geoid_height, &an_packet->data[0], sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_external_pitot_pressure_packet(external_pitot_pressure_packet_t *external_pitot_pressure_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_pitot_pressure && an_packet->length == 8)
	{
		memcpy(&external_pitot_pressure_packet->differential_pressure, &an_packet->data[0], sizeof(float));
		memcpy(&external_pitot_pressure_packet->outside_air_temperature, &an_packet->data[4], sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_pitot_pressure_packet(external_pitot_pressure_packet_t *external_pitot_pressure_packet)
{
	an_packet_t *an_packet = an_packet_allocate(8, packet_id_external_pitot_pressure);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_pitot_pressure_packet->differential_pressure, sizeof(float));
		memcpy(&an_packet->data[4], &external_pitot_pressure_packet->outside_air_temperature, sizeof(float));
	}
	return an_packet;
}

int decode_wind_packet(wind_packet_t *wind_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_wind && an_packet->length == 12)
	{
		memcpy(&wind_packet->wind_velocity[0], &an_packet->data[0], 2*sizeof(float));
		memcpy(&wind_packet->wind_standard_deviation, &an_packet->data[8], sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_wind_packet(wind_packet_t *wind_packet)
{
	an_packet_t *an_packet = an_packet_allocate(12, packet_id_wind);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &wind_packet->wind_velocity[0], 2*sizeof(float));
		memcpy(&an_packet->data[8], &wind_packet->wind_standard_deviation, sizeof(float));
	}
	return an_packet;
}

int decode_heave_packet(heave_packet_t *heave_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_heave && an_packet->length == 16)
	{
		memcpy(&heave_packet->heave_point_1, &an_packet->data[0], sizeof(float));
		memcpy(&heave_packet->heave_point_2, &an_packet->data[4], sizeof(float));
		memcpy(&heave_packet->heave_point_3, &an_packet->data[8], sizeof(float));
		memcpy(&heave_packet->heave_point_4, &an_packet->data[12], sizeof(float));
		return 0;
	}
	else return 1;
}

int decode_odometer_packet(odometer_packet_t *external_odometer_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_odometer && an_packet->length == 13)
	{
		memcpy(&external_odometer_packet->delay, &an_packet->data[0], sizeof(float));
		memcpy(&external_odometer_packet->speed, &an_packet->data[4], sizeof(float));
		memcpy(&external_odometer_packet->distance_travelled, &an_packet->data[8], sizeof(float));
		external_odometer_packet->flags.r = an_packet->data[12];
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_odometer_packet(odometer_packet_t *external_odometer_packet)
{
	an_packet_t *an_packet = an_packet_allocate(13, packet_id_external_odometer);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_odometer_packet->delay, sizeof(float));
		memcpy(&an_packet->data[4], &external_odometer_packet->speed, sizeof(float));
		memcpy(&an_packet->data[8], &external_odometer_packet->distance_travelled, sizeof(float));
		an_packet->data[12] = external_odometer_packet->flags.r;
	}
	return an_packet;
}

int decode_external_air_data_packet(external_air_data_packet_t *external_air_data_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_external_air_data && an_packet->length == 25)
	{
		memcpy(&external_air_data_packet->altitude_delay, &an_packet->data[0], sizeof(float));
		memcpy(&external_air_data_packet->airspeed_delay, &an_packet->data[4], sizeof(float));
		memcpy(&external_air_data_packet->altitude, &an_packet->data[8], sizeof(float));
		memcpy(&external_air_data_packet->airspeed, &an_packet->data[12], sizeof(float));
		memcpy(&external_air_data_packet->altitude_standard_deviation, &an_packet->data[16], sizeof(float));
		memcpy(&external_air_data_packet->airspeed_standard_deviation, &an_packet->data[20], sizeof(float));
		external_air_data_packet->flags.r = an_packet->data[24];
		return 0;
	}
	else return 1;
}

an_packet_t *encode_external_air_data_packet(external_air_data_packet_t *external_air_data_packet)
{
	an_packet_t *an_packet = an_packet_allocate(25, packet_id_external_air_data);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], &external_air_data_packet->altitude_delay, sizeof(float));
		memcpy(&an_packet->data[4], &external_air_data_packet->airspeed_delay, sizeof(float));
		memcpy(&an_packet->data[8], &external_air_data_packet->altitude, sizeof(float));
		memcpy(&an_packet->data[12], &external_air_data_packet->airspeed, sizeof(float));
		memcpy(&an_packet->data[16], &external_air_data_packet->altitude_standard_deviation, sizeof(float));
		memcpy(&an_packet->data[20], &external_air_data_packet->airspeed_standard_deviation, sizeof(float));
		an_packet->data[24] = external_air_data_packet->flags.r;
	}
	return an_packet;
}

/* Start of configuration packet functions */

int decode_packet_timer_period_packet(packet_timer_period_packet_t *packet_timer_period_packet, an_packet_t *an_packet)
{
    if(an_packet->id == packet_id_packet_timer_period && an_packet->length == 4)
    {
        packet_timer_period_packet->permanent = an_packet->data[0];
        packet_timer_period_packet->utc_synchronisation = an_packet->data[1];
        memcpy(&packet_timer_period_packet->packet_timer_period, &an_packet->data[2], sizeof(uint16_t));
        return 0;
    }
    else return 1;
}

an_packet_t *encode_packet_timer_period_packet(packet_timer_period_packet_t *packet_timer_period_packet)
{
	an_packet_t *an_packet = an_packet_allocate(4, packet_id_packet_timer_period);
	if(an_packet != NULL)
	{
		an_packet->data[0] = packet_timer_period_packet->permanent > 0;
		an_packet->data[1] = packet_timer_period_packet->utc_synchronisation > 0;
		memcpy(&an_packet->data[2], &packet_timer_period_packet->packet_timer_period, sizeof(uint16_t));
	}
    return an_packet;
}

int decode_packet_periods_packet(packet_periods_packet_t *packet_periods_packet, an_packet_t *an_packet)
{
    if(an_packet->id == packet_id_packet_periods && (an_packet->length - 2) % 5 == 0)
    {
        int i;
        int packet_periods_count = (an_packet->length - 2) / 5;
        packet_periods_packet->permanent = an_packet->data[0];
        packet_periods_packet->clear_existing_packets = an_packet->data[1];
        for(i = 0; i < MAXIMUM_PACKET_PERIODS; i++)
        {
            if(i < packet_periods_count)
            {
                packet_periods_packet->packet_periods[i].packet_id = an_packet->data[2 + 5*i];
                memcpy(&packet_periods_packet->packet_periods[i].period, &an_packet->data[2 + 5*i + 1], sizeof(uint32_t));
            }
            else memset(&packet_periods_packet->packet_periods[i], 0, sizeof(packet_period_t));
        }
        return 0;
    }
    else return 1;
}

an_packet_t *encode_packet_periods_packet(packet_periods_packet_t *packet_periods_packet)
{
    int i;
    an_packet_t *an_packet = an_packet_allocate(252, packet_id_packet_periods);
	if(an_packet != NULL)
	{
		an_packet->data[0] = packet_periods_packet->permanent > 0;
		an_packet->data[1] = packet_periods_packet->clear_existing_packets;
		for(i = 0; i < MAXIMUM_PACKET_PERIODS; i++)
		{
			if(packet_periods_packet->packet_periods[i].packet_id)
			{
				an_packet->data[2 + 5*i] = packet_periods_packet->packet_periods[i].packet_id;
				memcpy(&an_packet->data[2 + 5*i + 1], &packet_periods_packet->packet_periods[i].period, sizeof(uint32_t));
			}
			else break;
		}
		an_packet->length = 2 + 5*i;
	}
    return an_packet;
}

int decode_baud_rates_packet(baud_rates_packet_t *baud_rates_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_baud_rates && an_packet->length == 17)
	{
		baud_rates_packet->permanent = an_packet->data[0];
		memcpy(&baud_rates_packet->primary_baud_rate, &an_packet->data[1], sizeof(uint32_t));
		memcpy(&baud_rates_packet->gpio_1_2_baud_rate, &an_packet->data[5], sizeof(uint32_t));
		memcpy(&baud_rates_packet->auxiliary_baud_rate, &an_packet->data[9], sizeof(uint32_t));
		memcpy(&baud_rates_packet->reserved, &an_packet->data[13], sizeof(uint32_t));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_baud_rates_packet(baud_rates_packet_t *baud_rates_packet)
{
	an_packet_t *an_packet = an_packet_allocate(17, packet_id_baud_rates);
	if(an_packet != NULL)
	{
		an_packet->data[0] = baud_rates_packet->permanent;
		memcpy(&an_packet->data[1], &baud_rates_packet->primary_baud_rate, sizeof(uint32_t));
		memcpy(&an_packet->data[5], &baud_rates_packet->gpio_1_2_baud_rate, sizeof(uint32_t));
		memcpy(&an_packet->data[9], &baud_rates_packet->auxiliary_baud_rate, sizeof(uint32_t));
		memcpy(&an_packet->data[13], &baud_rates_packet->reserved, sizeof(uint32_t));
	}
	return an_packet;
}

int decode_sensor_ranges_packet(sensor_ranges_packet_t *sensor_ranges_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_sensor_ranges && an_packet->length == 4)
	{
		memcpy(sensor_ranges_packet, an_packet->data, 4*sizeof(uint8_t));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_sensor_ranges_packet(sensor_ranges_packet_t *sensor_ranges_packet)
{
	an_packet_t *an_packet = an_packet_allocate(4, packet_id_sensor_ranges);
	if(an_packet != NULL)
	{
		memcpy(an_packet->data, sensor_ranges_packet, 4*sizeof(uint8_t));
	}
	return an_packet;
}

int decode_installation_alignment_packet(installation_alignment_packet_t *installation_alignment_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_installation_alignment && an_packet->length == 73)
	{
		installation_alignment_packet->permanent = an_packet->data[0];
		memcpy(&installation_alignment_packet->alignment_dcm[0][0], &an_packet->data[1], 9*sizeof(float));
		memcpy(&installation_alignment_packet->gnss_antenna_offset[0], &an_packet->data[37], 3*sizeof(float));
		memcpy(&installation_alignment_packet->odometer_offset[0], &an_packet->data[49], 3*sizeof(float));
		memcpy(&installation_alignment_packet->external_data_offset[0], &an_packet->data[61], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_installation_alignment_packet(installation_alignment_packet_t *installation_alignment_packet)
{
	an_packet_t *an_packet = an_packet_allocate(73, packet_id_installation_alignment);
	if(an_packet != NULL)
	{
		an_packet->data[0] = installation_alignment_packet->permanent;
		memcpy(&an_packet->data[1], &installation_alignment_packet->alignment_dcm[0][0], 9*sizeof(float));
		memcpy(&an_packet->data[37], &installation_alignment_packet->gnss_antenna_offset[0], 3*sizeof(float));
		memcpy(&an_packet->data[49], &installation_alignment_packet->odometer_offset[0], 3*sizeof(float));
		memcpy(&an_packet->data[61], &installation_alignment_packet->external_data_offset[0], 3*sizeof(float));
	}
	return an_packet;
}

int decode_filter_options_packet(filter_options_packet_t *filter_options_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_filter_options && an_packet->length == 17)
	{
		memcpy(filter_options_packet, &an_packet->data[0], 9*sizeof(uint8_t));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_filter_options_packet(filter_options_packet_t *filter_options_packet)
{
	an_packet_t *an_packet = an_packet_allocate(17, packet_id_filter_options);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], filter_options_packet, 9*sizeof(uint8_t));
		memset(&an_packet->data[9], 0, 8*sizeof(uint8_t));
	}
	return an_packet;
}

int decode_gpio_configuration_packet(gpio_configuration_packet_t *gpio_configuration_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_gpio_configuration && an_packet->length == 13)
	{
		memcpy(gpio_configuration_packet, &an_packet->data[0], 5*sizeof(uint8_t));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_gpio_configuration_packet(gpio_configuration_packet_t *gpio_configuration_packet)
{
	an_packet_t *an_packet = an_packet_allocate(13, packet_id_gpio_configuration);
	if(an_packet != NULL)
	{
		memcpy(&an_packet->data[0], gpio_configuration_packet, 5*sizeof(uint8_t));
		memset(&an_packet->data[5], 0, 8*sizeof(uint8_t));
	}
	return an_packet;
}

int decode_magnetic_calibration_values_packet(magnetic_calibration_values_packet_t *magnetic_calibration_values_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_magnetic_calibration_values && an_packet->length == 49)
	{
		magnetic_calibration_values_packet->permanent = an_packet->data[0];
		memcpy(magnetic_calibration_values_packet->hard_iron, &an_packet->data[5], 3*sizeof(float));
		memcpy(magnetic_calibration_values_packet->soft_iron, &an_packet->data[13], 9*sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_magnetic_calibration_values_packet(magnetic_calibration_values_packet_t *magnetic_calibration_values_packet)
{
	an_packet_t *an_packet = an_packet_allocate(49, packet_id_magnetic_calibration_values);
	if(an_packet != NULL)
	{
		an_packet->data[0] = magnetic_calibration_values_packet->permanent;
		memcpy(&an_packet->data[1], magnetic_calibration_values_packet->hard_iron, 3*sizeof(float));
		memcpy(&an_packet->data[13], magnetic_calibration_values_packet->soft_iron, 9*sizeof(float));
	}
	return an_packet;
}

an_packet_t *encode_magnetic_calibration_configuration_packet(magnetic_calibration_configuration_packet_t *magnetic_calibration_configuration_packet)
{
	an_packet_t *an_packet = an_packet_allocate(1, packet_id_magnetic_calibration_configuration);
	if(an_packet != NULL)
	{
		an_packet->data[0] = magnetic_calibration_configuration_packet->magnetic_calibration_action;
	}
	return an_packet;
}

int decode_magnetic_calibration_status_packet(magnetic_calibration_status_packet_t *magnetic_calibration_status_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_magnetic_calibration_status && an_packet->length == 3)
	{
		magnetic_calibration_status_packet->magnetic_calibration_status = an_packet->data[0];
		magnetic_calibration_status_packet->magnetic_calibration_progress_percentage = an_packet->data[1];
		magnetic_calibration_status_packet->local_magnetic_error_percentage = an_packet->data[2];
		return 0;
	}
	return 1;
}

int decode_odometer_configuration_packet(odometer_configuration_packet_t *odometer_configuration_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_odometer_configuration && an_packet->length == 8)
	{
		odometer_configuration_packet->permanent = an_packet->data[0];
		odometer_configuration_packet->automatic_calibration = an_packet->data[1];
		memcpy(&odometer_configuration_packet->pulse_length, &an_packet->data[4], sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_odometer_configuration_packet(odometer_configuration_packet_t *odometer_configuration_packet)
{
	an_packet_t *an_packet = an_packet_allocate(8, packet_id_odometer_configuration);
	if(an_packet != NULL)
	{
		an_packet->data[0] = odometer_configuration_packet->permanent;
		an_packet->data[1] = odometer_configuration_packet->automatic_calibration;
		memset(&an_packet->data[2], 0, 2*sizeof(uint8_t));
		memcpy(&an_packet->data[4], &odometer_configuration_packet->pulse_length, sizeof(float));
	}
	return an_packet;
}

an_packet_t *encode_zero_alignment_packet(zero_alignment_packet_t *zero_alignment_packet)
{
	uint32_t verification = 0x9A4E8055;
	an_packet_t *an_packet = an_packet_allocate(5, packet_id_zero_alignment);
	if(an_packet != NULL)
	{
		an_packet->data[0] = zero_alignment_packet->permanent;
		memcpy(&an_packet->data[1], &verification, sizeof(uint32_t));
	}
	return an_packet;
}

int decode_heave_offset_packet(heave_offset_packet_t *heave_offset_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_heave_offset && an_packet->length == 49)
	{
		heave_offset_packet->permanent = an_packet->data[0];
		memcpy(&heave_offset_packet->heave_point_1_offset[0], &an_packet->data[1], 3*sizeof(float));
		memcpy(&heave_offset_packet->heave_point_2_offset[0], &an_packet->data[13], 3*sizeof(float));
		memcpy(&heave_offset_packet->heave_point_3_offset[0], &an_packet->data[25], 3*sizeof(float));
		memcpy(&heave_offset_packet->heave_point_4_offset[0], &an_packet->data[37], 3*sizeof(float));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_heave_offset_packet(heave_offset_packet_t *heave_offset_packet)
{
	an_packet_t *an_packet = an_packet_allocate(49, packet_id_odometer_configuration);
	if(an_packet != NULL)
	{
		an_packet->data[0] = heave_offset_packet->permanent;
		memcpy(&an_packet->data[1], &heave_offset_packet->heave_point_1_offset[0], 3*sizeof(float));
		memcpy(&an_packet->data[13], &heave_offset_packet->heave_point_2_offset[0], 3*sizeof(float));
		memcpy(&an_packet->data[25], &heave_offset_packet->heave_point_3_offset[0], 3*sizeof(float));
		memcpy(&an_packet->data[37], &heave_offset_packet->heave_point_4_offset[0], 3*sizeof(float));
	}
	return an_packet;
}

int decode_gpio_output_configuration_packet(gpio_output_configuration_packet_t *gpio_output_configuration_packet, an_packet_t *an_packet)
{
	if(an_packet->id == packet_id_gpio_output_configuration && an_packet->length == 33)
	{
		gpio_output_configuration_packet->permanent = an_packet->data[0];
		gpio_output_configuration_packet->nmea_fix_behaviour = an_packet->data[1];
		memcpy(&gpio_output_configuration_packet->gpzda_rate.r, &an_packet->data[2], sizeof(uint16_t));
		memcpy(&gpio_output_configuration_packet->gpgga_rate.r, &an_packet->data[4], sizeof(uint16_t));
		memcpy(&gpio_output_configuration_packet->gpvtg_rate.r, &an_packet->data[6], sizeof(uint16_t));
		memcpy(&gpio_output_configuration_packet->gprmc_rate.r, &an_packet->data[8], sizeof(uint16_t));
		memcpy(&gpio_output_configuration_packet->gphdt_rate.r, &an_packet->data[10], sizeof(uint16_t));
		memcpy(&gpio_output_configuration_packet->gpgll_rate.r, &an_packet->data[12], sizeof(uint16_t));
		memcpy(&gpio_output_configuration_packet->pashr_rate.r, &an_packet->data[14], sizeof(uint16_t));
		memcpy(&gpio_output_configuration_packet->tss1_rate.r, &an_packet->data[16], sizeof(uint16_t));
		memcpy(&gpio_output_configuration_packet->simrad_rate.r, &an_packet->data[18], sizeof(uint16_t));
		return 0;
	}
	else return 1;
}

an_packet_t *encode_gpio_output_configuration_packet(gpio_output_configuration_packet_t *gpio_output_configuration_packet)
{
	an_packet_t *an_packet = an_packet_allocate(33, packet_id_gpio_output_configuration);
	if(an_packet != NULL)
	{
		an_packet->data[0] = gpio_output_configuration_packet->permanent;
		an_packet->data[1] = gpio_output_configuration_packet->nmea_fix_behaviour;
		memcpy(&an_packet->data[2], &gpio_output_configuration_packet->gpzda_rate.r, sizeof(uint16_t));
		memcpy(&an_packet->data[4], &gpio_output_configuration_packet->gpgga_rate.r, sizeof(uint16_t));
		memcpy(&an_packet->data[6], &gpio_output_configuration_packet->gpvtg_rate.r, sizeof(uint16_t));
		memcpy(&an_packet->data[8], &gpio_output_configuration_packet->gprmc_rate.r, sizeof(uint16_t));
		memcpy(&an_packet->data[10], &gpio_output_configuration_packet->gphdt_rate.r, sizeof(uint16_t));
		memcpy(&an_packet->data[12], &gpio_output_configuration_packet->gpgll_rate.r, sizeof(uint16_t));
		memcpy(&an_packet->data[14], &gpio_output_configuration_packet->pashr_rate.r, sizeof(uint16_t));
		memcpy(&an_packet->data[16], &gpio_output_configuration_packet->tss1_rate.r, sizeof(uint16_t));
		memcpy(&an_packet->data[18], &gpio_output_configuration_packet->simrad_rate.r, sizeof(uint16_t));
		memset(&an_packet->data[20], 0, 13*sizeof(uint8_t));
	}
	return an_packet;
}
