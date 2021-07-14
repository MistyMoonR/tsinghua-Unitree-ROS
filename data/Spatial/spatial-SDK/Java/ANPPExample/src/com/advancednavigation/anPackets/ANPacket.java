/****************************************************************/
/*                                                              */
/*      Advanced Navigation Packet Protocol Library             */
/*            Java Language SDK, Version 4.0                    */
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

package com.advancednavigation.anPackets;

public class ANPacket
{
	public static final int PACKET_ID_ACKNOWLEDGE = 0;
	public static final int PACKET_ID_REQUEST = 1;
	public static final int PACKET_ID_BOOT_MODE = 2;
	public static final int PACKET_ID_DEVICE_INFORMATION = 3;
	public static final int PACKET_ID_RESTORE_FACTORY_SETTINGS = 4;
	public static final int PACKET_ID_RESET = 5;
	public static final int PACKET_ID_PRINT = 6;
	public static final int PACKET_ID_FILE_TRANSFER_REQUEST = 7;
	public static final int PACKET_ID_FILE_TRANSFER_ACKNOWLEDGE = 8;
	public static final int PACKET_ID_FILE_TRANSFER = 9;
	
	public static final int PACKET_ID_SYSTEM_STATE = 20;
	public static final int PACKET_ID_UNIX_TIME = 21;
	public static final int PACKET_ID_STATUS = 23;
	public static final int PACKET_ID_RAW_SENSORS = 28;
	public static final int PACKET_ID_SATELLITES = 30;
	public static final int PACKET_ID_SATELLITES_DETAILED = 31;
	public static final int PACKET_ID_EULER_ORIENTATION = 39;
	public static final int PACKET_ID_EXTERNAL_POSITION = 45;
	public static final int PACKET_ID_ODOMETER_STATE = 51;

	public static final int PACKET_ID_PACKET_TIMER_PERIOD = 180;
	public static final int PACKET_ID_PACKETS_PERIOD = 181;
	public static final int PACKET_ID_BAUD_RATE = 182;
	public static final int PACKET_ID_SENSOR_RANGES = 184;
	public static final int PACKET_ID_INSTALLATION_ALIGNMENT = 185;
	public static final int PACKET_ID_FILTER_OPTIONS = 186;
	public static final int PACKET_ID_GPIO_CONFIGURATION = 188;
	public static final int PACKET_ID_MAGNETIC_CALIBRATION_VALUES = 189;
	public static final int PACKET_ID_MAGNETIC_CALIBRATION_CONFIGURATION = 190;
	public static final int PACKET_ID_MAGNETIC_CALIBRATION_STATUS = 191;
	public static final int PACKET_ID_ODOMETER_CONFIGURATION = 192;
	public static final int PACKET_ID_ZERO_ALIGNMENT = 193;
	
	public int id;
	public int length;
	public byte[] data;
	
	public ANPacket(int length, int id)
	{
		this.length = length;
		this.id = id;
		this.data = new byte[length];
	}
}
