/****************************************************************/
/*                                                              */
/*          Advanced Navigation Packet Protocol Library         */
/*             Serial Port Data Logger, Version 4.0             */
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
#include <time.h>

#ifdef _WIN32
#include <Windows.h>
#else
#include <unistd.h>
#endif

#include "rs232/rs232.h"

int main(int argc, char *argv[])
{
	uint8_t buffer[256];
	int bytes_received;
	
	FILE *log_file;
	char filename[32];
	time_t rawtime;
	struct tm * timeinfo;
	int write_counter = 0;

	if (argc != 3)
	{
		printf("Usage - program com_port baud_rate\nExample - packet_example.exe COM1 115200\n");
		exit(EXIT_FAILURE);
	}
	
	rawtime = time(NULL);
	timeinfo = localtime (&rawtime);
	sprintf(filename, "SpatialLog_%02d-%02d-%02d_%02d-%02d-%02d.anpp", timeinfo->tm_year-100, timeinfo->tm_mon+1, timeinfo->tm_mday, timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);
	
	log_file = fopen(filename, "wb");
	
	/* open the com port */
	if (OpenComport(argv[1], atoi(argv[2])) || log_file == NULL)
	{
		exit(EXIT_FAILURE);
	}

	while (1)
	{
		if ((bytes_received = PollComport(buffer, sizeof(buffer))) > 0)
		{
			fwrite(buffer, sizeof(uint8_t), bytes_received, log_file);
		}
		if(write_counter++ >= 100)
		{
			fflush(log_file);
			write_counter = 0;
		}
#ifdef _WIN32
    Sleep(10);
#else
    usleep(10000);
#endif
	}
}
