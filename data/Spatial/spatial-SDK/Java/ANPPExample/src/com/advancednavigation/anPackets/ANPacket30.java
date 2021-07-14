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

public class ANPacket30
{
	public int gpsSatellites;
	public int glonassSatellites;
	public int sbasSatellites;
	public int compassSatellites;
	public int galileoSatellites;
	public float hdop;
	public float vdop;
	
	public ANPacket30()
	{
		gpsSatellites = 0;
		glonassSatellites = 0;
		sbasSatellites = 0;
		compassSatellites = 0;
		galileoSatellites = 0;
		hdop = 0;
		vdop = 0;
	}
	
	public ANPacket30(ANPacket packet)
	{
		gpsSatellites = packet.data[8]&0xFF;
		glonassSatellites = packet.data[9]&0xFF;
		compassSatellites = packet.data[10]&0xFF;
		galileoSatellites = packet.data[11]&0xFF;
		sbasSatellites = packet.data[12]&0xFF;
		hdop = TypeConversion.bytesToFloat(packet.data, 0);
		vdop = TypeConversion.bytesToFloat(packet.data, 4);
	}
}
