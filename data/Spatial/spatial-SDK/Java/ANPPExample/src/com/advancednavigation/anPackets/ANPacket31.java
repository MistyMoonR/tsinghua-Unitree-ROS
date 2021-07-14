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

public class ANPacket31
{
	public int gpsSatellites;
	public int glonassSatellites;
	public int sbasSatellites;
	public int compassSatellites;
	public int galileoSatellites;
	public Satellite[] satellites;
	
	public ANPacket31()
	{
		gpsSatellites = 0;
		glonassSatellites = 0;
		sbasSatellites = 0;
		compassSatellites = 0;
		galileoSatellites = 0;
		satellites = new Satellite[0];
	}
	
	public ANPacket31(ANPacket packet)
	{
		gpsSatellites = 0;
		glonassSatellites = 0;
		sbasSatellites = 0;
		compassSatellites = 0;
		galileoSatellites = 0;
		satellites = new Satellite[packet.length/7];
		for(int i=0; i < satellites.length; i++)
		{
			satellites[i] = new Satellite();
			satellites[i].navigationSystem = packet.data[7*i]&0xFF;
			satellites[i].number = packet.data[7*i+1]&0xFF;
			satellites[i].frequency = packet.data[7*i+2];
			satellites[i].elevation = packet.data[7*i+3]&0xFF;
			satellites[i].azimuth = TypeConversion.bytesToUInt16(packet.data, 7*i+4);
			satellites[i].snr = packet.data[7*i+6]&0xFF;
			if(satellites[i].navigationSystem == 1) gpsSatellites++;
			else if(satellites[i].navigationSystem == 2) glonassSatellites++;
			else if(satellites[i].navigationSystem == 4) sbasSatellites++;
			else if(satellites[i].navigationSystem == 6) compassSatellites++;
			else if(satellites[i].navigationSystem == 5) galileoSatellites++;
		}
	}
	
	public class Satellite
	{
		public int navigationSystem;
		public int number;
		public int frequency;
		public int elevation;
		public int azimuth;
		public int snr;
	}
}
