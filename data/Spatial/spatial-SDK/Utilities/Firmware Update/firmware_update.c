/****************************************************************/
/*                                                              */
/*          Advanced Navigation Firmware Update Example         */
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
#include <time.h>

#ifdef _WIN32
#include <Windows.h>
#else
#include <unistd.h>
#endif

#include "../../C/Dynamic/rs232/rs232.h"
#include "../../C/Dynamic/an_packet_protocol.h"
#include "../../C/Dynamic/spatial_packets.h"

#define FIRST_PACKET_FIRMWARE_TIMEOUT 10;
#define SUBSEQUENT_PACKETS_FIRMWARE_TIMEOUT 2;

#define FILE_TRANSFER_FIRST_HEADER_SIZE 16
#define FILE_TRANSFER_ONGOING_HEADER_SIZE 8
#define FILE_TRANSFER_REQUEST_HEADER_SIZE 8
#define FILE_TRANSFER_ACKNOWLEDGE_SIZE 9
#define AN_FIRMWARE_METADATA_SIZE 48
#define AN_FIRMWARE_PAYLOAD_SIZE 224

int an_packet_transmit(an_packet_t *an_packet)
{
	an_packet_encode(an_packet);
	return SendBuf(an_packet_pointer(an_packet), an_packet_size(an_packet)) != an_packet_size(an_packet);
}

void sleep_milliseconds(uint32_t milliseconds)
{
#ifdef _WIN32
    	Sleep(milliseconds);
#else
    	usleep(milliseconds*1000);
#endif
}

int main(int argc, char *argv[])
{
	an_decoder_t an_decoder;
	an_packet_t *an_packet;
	
	an_packet_t **firmware_packets;
	uint32_t firmware_packets_length;
	uint32_t file_transfer_unique_id;
	uint32_t file_transfer_packet_index = 0;
	time_t file_transfer_timeout = 0;
	time_t failure_timeout;
	int file_transfer_percentage = 0;
	uint32_t temporary_uint32;
	uint16_t temporary_uint16;
	
	file_transfer_acknowledge_packet_t file_transfer_acknowledge_packet;
	
	FILE *firmware_file;
	uint32_t firmware_file_length;
	char firmware_identifier[4];
	uint32_t firmware_device_id;
	uint32_t firmware_version;
	time_t firmware_timestamp;
	
	int bytes_received, i;

	failure_timeout = time(NULL) + 2*FIRST_PACKET_FIRMWARE_TIMEOUT;

	if (argc != 4)
	{
		printf("Usage - program com_port baud_rate firmware_filename\nExample - firmware_update.exe COM1 115200 spatial.anfw\n");
		exit(EXIT_FAILURE);
	}
	
	/* Open the serial port */
	if (OpenComport(argv[1], atoi(argv[2])))
	{
		printf("Could not open serial port\n");
		exit(EXIT_FAILURE);
	}
	
	if((firmware_file = fopen(argv[3],"rb")) == NULL)
	{
		printf("Could not open firmware file\n");
		exit(EXIT_FAILURE);
	}
	
	/* Command the unit to go into the bootloader */
	/* In this example the program is not waiting for an acknowledge, so we send it twice to increase the chances it is received */
	an_packet = an_packet_allocate(1, packet_id_boot_mode);
	an_packet->data[0] = boot_mode_bootloader;
	an_packet_transmit(an_packet);
	an_packet_transmit(an_packet);
	an_packet_free(&an_packet);
	
	/* Check the firmware file */
	fseek(firmware_file, 0, SEEK_END);
	firmware_file_length = ftell(firmware_file);
	fseek(firmware_file, 0, SEEK_SET);
	fread(&firmware_identifier, sizeof(uint8_t), 4, firmware_file);
	fread(&firmware_device_id, sizeof(uint8_t), 4, firmware_file);
	fread(&firmware_version, sizeof(uint8_t), 4, firmware_file);
	fread(&temporary_uint32, sizeof(uint8_t), 4, firmware_file);
	firmware_timestamp = temporary_uint32; /* Cast 32 bit timestamp to time_t for compatibility with 64 bit systems */
	fseek(firmware_file, 0, SEEK_SET);
	if(firmware_file_length < 4096 || firmware_file_length > 2097152 || strncmp(firmware_identifier, "ANFW", 4))
	{
		printf("Invalid ANFW firmware file\n");
		exit(EXIT_FAILURE);
	}
	
	/* Print the firmware version and generation time */
	printf("Firmware Target Device ID: %d\nFirmware Version: %f\nFirmware Generation Time: %s", firmware_device_id, firmware_version/1000.0, ctime(&firmware_timestamp));
	
	/* Load the firmware file into firmware packets in memory */
	firmware_packets_length = firmware_file_length / AN_FIRMWARE_PAYLOAD_SIZE + ((firmware_file_length % AN_FIRMWARE_PAYLOAD_SIZE) > 0);
	firmware_packets = malloc(firmware_packets_length*sizeof(an_packet_t *));
	if(firmware_packets == NULL)
	{
		printf("Error allocating memory\n");
		exit(EXIT_FAILURE);
	}
	/* The structure of the first packet is different to subsequent packets so fill this seperately */
	firmware_packets[0] = an_packet_allocate(FILE_TRANSFER_FIRST_HEADER_SIZE + AN_FIRMWARE_PAYLOAD_SIZE, packet_id_file_transfer);
	if(firmware_packets[0] == NULL)
	{
		printf("Error allocating memory\n");
		exit(EXIT_FAILURE);
	}
	srand(time(NULL));
	file_transfer_unique_id = rand();
	memcpy(&firmware_packets[0]->data[0], &file_transfer_unique_id, sizeof(uint32_t));
	temporary_uint32 = 0;
	memcpy(&firmware_packets[0]->data[4], &temporary_uint32, sizeof(uint32_t)); /* file transfer data index */
	memcpy(&firmware_packets[0]->data[8], &firmware_file_length, sizeof(uint32_t));
	firmware_packets[0]->data[12] = data_encoding_aes256;
	firmware_packets[0]->data[13] = file_transfer_metadata_an_firmware;
	temporary_uint16 = AN_FIRMWARE_METADATA_SIZE;
	memcpy(&firmware_packets[0]->data[14], &temporary_uint16, sizeof(uint16_t)); /* metadata size */
	fread(&firmware_packets[0]->data[16], sizeof(uint8_t), AN_FIRMWARE_PAYLOAD_SIZE, firmware_file);
	/* Fill all remaining packets */
	for(i = 1; i < firmware_packets_length; i++)
	{
		int payload_size;
		if(firmware_file_length - i*AN_FIRMWARE_PAYLOAD_SIZE < AN_FIRMWARE_PAYLOAD_SIZE)
		{
			payload_size = firmware_file_length - i*AN_FIRMWARE_PAYLOAD_SIZE;
		}
		else
		{
			payload_size = AN_FIRMWARE_PAYLOAD_SIZE;
		}
		firmware_packets[i] = an_packet_allocate(FILE_TRANSFER_ONGOING_HEADER_SIZE + payload_size, packet_id_file_transfer);
		if(firmware_packets[i] == NULL)
		{
			printf("Error allocating memory\n");
			exit(EXIT_FAILURE);
		}
		memcpy(&firmware_packets[i]->data[0], &file_transfer_unique_id, sizeof(uint32_t));
		temporary_uint32 = i * AN_FIRMWARE_PAYLOAD_SIZE;
		memcpy(&firmware_packets[i]->data[4], &temporary_uint32, sizeof(uint32_t)); /* file transfer data index */
		fread(&firmware_packets[i]->data[8], sizeof(uint8_t), AN_FIRMWARE_PAYLOAD_SIZE, firmware_file);
	}
	fclose(firmware_file);
	
	/* Close the serial port and reopen it at 115200 (the fixed baud rate of the bootloader) */
	sleep_milliseconds(50);
	CloseComport();
	if (OpenComport(argv[1], 115200))
	{
		printf("Could not open serial port\n");
		exit(EXIT_FAILURE);
	}
	
	an_decoder_initialise(&an_decoder);

	printf("Starting firmware update\n");

	while (1)
	{
		if ((bytes_received = PollComport(an_decoder_pointer(&an_decoder), an_decoder_size(&an_decoder))) > 0)
		{
			/* increment the decode buffer length by the number of bytes received */
			an_decoder_increment(&an_decoder, bytes_received);
			
			/* decode all the packets in the buffer */
			while ((an_packet = an_packet_decode(&an_decoder)) != NULL)
			{
				if (an_packet->id == packet_id_file_transfer_acknowledge)
				{
					if(!decode_file_transfer_acknowledge_packet(&file_transfer_acknowledge_packet, an_packet))
					{
						if(file_transfer_acknowledge_packet.unique_id == file_transfer_unique_id)
						{
							if(file_transfer_acknowledge_packet.response_code == file_transfer_response_ready || file_transfer_acknowledge_packet.response_code == file_transfer_response_index_mismatch)
							{
								int packet_count = file_transfer_acknowledge_packet.data_index / AN_FIRMWARE_PAYLOAD_SIZE;
								if(packet_count < firmware_packets_length)
								{
									int new_percentage = 100 * packet_count / firmware_packets_length;
									file_transfer_packet_index = packet_count;
									an_packet_transmit(firmware_packets[file_transfer_packet_index]);
									failure_timeout = time(NULL) + 2*FIRST_PACKET_FIRMWARE_TIMEOUT;
									if(file_transfer_packet_index == 0)
									{
										file_transfer_timeout = time(NULL) + FIRST_PACKET_FIRMWARE_TIMEOUT;
									}
									else
									{
										file_transfer_timeout = time(NULL) + SUBSEQUENT_PACKETS_FIRMWARE_TIMEOUT;
									}
									if(new_percentage != file_transfer_percentage)
									{
										file_transfer_percentage = new_percentage;
										printf("Firmware update %d%% complete\n", file_transfer_percentage);
									}
								}
							}
							else if(file_transfer_acknowledge_packet.response_code == file_transfer_response_completed_successfully)
							{
								printf("Firmware update completed successfully\n");
								exit(EXIT_SUCCESS);
							}
							else
							{
								printf("Firmware update failure with response code %d\n", file_transfer_acknowledge_packet.response_code);
								exit(EXIT_FAILURE);
							}
						}
					}
				}
				
				/* Ensure that you free the an_packet when your done with it or you will leak memory */
				an_packet_free(&an_packet);
			}
		}
		if(file_transfer_timeout < time(NULL))
		{
			an_packet_transmit(firmware_packets[file_transfer_packet_index]);
			if(file_transfer_packet_index == 0)
			{
				file_transfer_timeout = time(NULL) + FIRST_PACKET_FIRMWARE_TIMEOUT;
			}
			else
			{
				file_transfer_timeout = time(NULL) + SUBSEQUENT_PACKETS_FIRMWARE_TIMEOUT;
			}
		}
		if(failure_timeout < time(NULL))
		{
			printf("Firmware update failure timeout\n");
			exit(EXIT_FAILURE);
		}
		sleep_milliseconds(10);		
	}
	exit(EXIT_SUCCESS);
}
