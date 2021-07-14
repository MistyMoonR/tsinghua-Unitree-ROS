/****************************************************************/
/*                                                              */
/*      Advanced Navigation Packet Protocol Library             */
/*             State Log Parser, Version 4.0                    */
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

#define DEGREES_TO_RADIANS (M_PI/180.0)

typedef enum
{
	gnss_fix_none,
	gnss_fix_2d,
	gnss_fix_3d,
	gnss_fix_sbas,
	gnss_fix_differential,
	gnss_fix_omnistar,
	gnss_fix_rtk_float,
	gnss_fix_rtk_fixed
} gnss_fix_type_e;

typedef struct
{
	union
	{
		uint16_t r;
		struct
		{
			unsigned int system_failure :1;
			unsigned int accelerometer_sensor_failure :1;
			unsigned int gyroscope_sensor_failure :1;
			unsigned int magnetometer_sensor_failure :1;
			unsigned int pressure_sensor_failure :1;
			unsigned int gnss_failure :1;
			unsigned int accelerometer_over_range :1;
			unsigned int gyroscope_over_range :1;
			unsigned int magnetometer_over_range :1;
			unsigned int pressure_over_range :1;
			unsigned int minimum_temperature_alarm :1;
			unsigned int maximum_temperature_alarm :1;
			unsigned int low_voltage_alarm :1;
			unsigned int high_voltage_alarm :1;
			unsigned int gnss_antenna_disconnected :1;
			unsigned int serial_port_overflow_alarm :1;
		} b;
	} system_status;
	union
	{
		uint16_t r;
		struct
		{
		    unsigned int orientation_filter_initialised :1;
		    unsigned int ins_filter_initialised :1;
		    unsigned int heading_initialised :1;
		    unsigned int utc_time_initialised :1;
		    unsigned int gnss_fix_type :3;
		    unsigned int event1_flag :1;
		    unsigned int event2_flag :1;
		    unsigned int internal_gnss_enabled :1;
		    unsigned int magnetometers_enabled :1;
		    unsigned int velocity_heading_enabled :1;
		    unsigned int atmospheric_altitude_enabled :1;
		    unsigned int external_position_active :1;
		    unsigned int external_velocity_active :1;
		    unsigned int external_heading_active :1;
		} b;
	} filter_status;
	uint32_t unix_time_seconds;
	uint32_t microseconds;
	double latitude;
	double longitude;
	double height;
	float velocity[3];
	float body_acceleration[3];
	float g_force;
	float orientation[3];
	float angular_velocity[3];
	float standard_deviation[3];
} system_state_packet_t;

int main(int argc, char *argv[])
{
    FILE *log_file;
    char buffer[512];
    system_state_packet_t system_state_packet;
    int valid_line_count = 0;
    
    if(argc != 2)
    {
        printf("Incorrect number of arguments supplied\n");
        printf("Usage: state_log_parser.exe State.csv\n");
        exit(EXIT_FAILURE);
    }
    
    log_file = fopen(argv[1], "r");
    if(log_file == NULL)
    {
        printf("Error opening log file\n");
        exit(EXIT_FAILURE);
    }
    fgets(buffer, sizeof(buffer), log_file);
    
    while(fgets(buffer, sizeof(buffer), log_file) != NULL)
    {
        int token_count = 0;
        char *token;
        system_state_packet.system_status.r = 0;
        system_state_packet.filter_status.r = 0;
        strtok(buffer,",");
        while((token = strtok(NULL,",")) != NULL)
        {
            if(token_count == 0) system_state_packet.unix_time_seconds = strtoul(token, NULL, 10);
            else if(token_count == 1) system_state_packet.microseconds = atoi(token);
			else if(token_count == 22) system_state_packet.filter_status.gnss_fix_type = atoi(token);
            else if(token_count < 34)
            {
                uint8_t boolean = 0;
                if(!strcmp(token,"1") || !strcmp(token, "true"))
                {
                    boolean = 1;
                }
                if(token_count < 18)
                {
                    system_state_packet.system_status.r |= boolean<<(token_count-2);
                }
                else
                {
                    system_state_packet.filter_status.r |= boolean<<(token_count-16);
                }
            }
            else if(token_count == 34) system_state_packet.latitude = atof(token)*DEGREES_TO_RADIANS;
            else if(token_count == 35) system_state_packet.longitude = atof(token)*DEGREES_TO_RADIANS;
            else if(token_count == 36) system_state_packet.height = atof(token);
            else if(token_count == 37) system_state_packet.velocity[0] = atof(token);
            else if(token_count == 38) system_state_packet.velocity[1] = atof(token);
            else if(token_count == 39) system_state_packet.velocity[2] = atof(token);
            else if(token_count == 40) system_state_packet.body_acceleration[0] = atof(token);
            else if(token_count == 41) system_state_packet.body_acceleration[1] = atof(token);
            else if(token_count == 42) system_state_packet.body_acceleration[2] = atof(token);
            else if(token_count == 43) system_state_packet.g_force = atof(token);
            else if(token_count == 44) system_state_packet.orientation[0] = atof(token)*DEGREES_TO_RADIANS;
            else if(token_count == 45) system_state_packet.orientation[1] = atof(token)*DEGREES_TO_RADIANS;
            else if(token_count == 46) system_state_packet.orientation[2] = atof(token)*DEGREES_TO_RADIANS;
            else if(token_count == 47) system_state_packet.angular_velocity[0] = atof(token)*DEGREES_TO_RADIANS;
            else if(token_count == 48) system_state_packet.angular_velocity[1] = atof(token)*DEGREES_TO_RADIANS;
            else if(token_count == 49) system_state_packet.angular_velocity[2] = atof(token)*DEGREES_TO_RADIANS;
            else if(token_count == 50) system_state_packet.standard_deviation[0] = atof(token);
            else if(token_count == 51) system_state_packet.standard_deviation[1] = atof(token);
            else if(token_count == 52) system_state_packet.standard_deviation[2] = atof(token);
            token_count++;
        }

        if(token_count == 53)
        {
            valid_line_count++;
            
            /*
             * At this point all the fields of the system_state_packet have been filled with a line from
             * the log file and the data can be processed as required.
             * e.g. printf("Latitude = %f, Filter Ready = %d\n, system_state_packet.latitude, system_state_packet.filter_status.b.ins_filter_initialised);
             */
        }
    }
    fclose(log_file);
    
    printf("%d lines successfully parsed from log file\n", valid_line_count);
    return EXIT_SUCCESS;
}
