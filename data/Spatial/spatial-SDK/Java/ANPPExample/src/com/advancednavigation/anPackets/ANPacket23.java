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

public class ANPacket23
{
	public static final int GNSS_NO_FIX = 0;
	public static final int GNSS_2D_FIX = 1;
	public static final int GNSS_3D_FIX = 2;
	public static final int GNSS_SBAS_FIX = 3;
	public static final int GNSS_DIFFERENTIAL_FIX = 4;
	public static final int GNSS_OMNISTAR_FIX = 5;
	public static final int GNSS_RTK_FLOAT_FIX = 6;
	public static final int GNSS_RTK_FIXED_FIX = 7;
	
	public Boolean statusAlert = false;
	
	public Boolean systemFailure = false;
	public Boolean accelerometerSensorFailure = false;
	public Boolean gyroscopeSensorFailure = false;
	public Boolean magnetometerSensorFailure = false;
	public Boolean pressureSensorFailure = false;
	public Boolean gnssFailure = false;
	public Boolean accelerometerOverRange = false;
	public Boolean gyroscopeOverRange = false;
	public Boolean magnetometerOverRange = false;
	public Boolean pressureOverRange = false;
	public Boolean minimumTemperatureAlarm = false;
	public Boolean maximumTemperatureAlarm = false;
	public Boolean lowVoltageAlarm = false;
	public Boolean highVoltageAlarm = false;
	public Boolean gnssAntennaAlarm = false;
	public Boolean dataOverflowAlarm = false;

	public Boolean gnssFix = false;
	
	public Boolean orientationFilterInitialised = false;
	public Boolean insFilterInitialised = false;
	public Boolean headingInitialised = false;
	public Boolean utcTimeValid = false;
	public int gnssFixType = GNSS_NO_FIX;
	public Boolean event1Flag = false;
	public Boolean event2Flag = false;
	public Boolean internalGnssActive = false;
	public Boolean magnetometersActive = false;
	public Boolean velocityHeadingActive = false;
	public Boolean atmosphericAltitudeActive = false;
	public Boolean externalPositionActive = false;
	public Boolean externalVelocityActive = false;
	public Boolean externalHeadingActive = false;
	
	public ANPacket23()
	{
	}

	public ANPacket23(ANPacket packet)
	{
		if (packet.data[0] != 0)
		{
			statusAlert = true;
			if ((packet.data[0] & 0x01) != 0) systemFailure = true;
			if ((packet.data[0] & 0x02) != 0) accelerometerSensorFailure = true;
			if ((packet.data[0] & 0x04) != 0) gyroscopeSensorFailure = true;
			if ((packet.data[0] & 0x08) != 0) magnetometerSensorFailure = true;
			if ((packet.data[0] & 0x10) != 0) pressureSensorFailure = true;
			if ((packet.data[0] & 0x20) != 0) gnssFailure = true;
			if ((packet.data[0] & 0x40) != 0) accelerometerOverRange = true;
			if ((packet.data[0] & 0x80) != 0) gyroscopeOverRange = true;
		}
		if(packet.data[1] != 0)
		{
			statusAlert = true;
			if ((packet.data[1] & 0x01) != 0) magnetometerOverRange = true;
			if ((packet.data[1] & 0x02) != 0) pressureOverRange = true;
			if ((packet.data[1] & 0x04) != 0) minimumTemperatureAlarm = true;
			if ((packet.data[1] & 0x08) != 0) maximumTemperatureAlarm = true;
			if ((packet.data[1] & 0x10) != 0) lowVoltageAlarm = true;
			if ((packet.data[1] & 0x20) != 0) highVoltageAlarm = true;
			if ((packet.data[1] & 0x40) != 0) gnssAntennaAlarm = true;
			if ((packet.data[1] & 0x80) != 0) dataOverflowAlarm = true;
		}
		if((packet.data[2] & 0x01) != 0) orientationFilterInitialised = true;
		if((packet.data[2] & 0x02) != 0) insFilterInitialised = true;
		if((packet.data[2] & 0x04) != 0) headingInitialised = true;
		if((packet.data[2] & 0x08) != 0) utcTimeValid = true;
		gnssFixType = (packet.data[2] & 0x70)>>>4;
		if(gnssFixType > GNSS_NO_FIX) gnssFix = true;
		if((packet.data[2] & 0x80) != 0) event1Flag = true;
		if((packet.data[3] & 0x01) != 0) event2Flag = true;
		if((packet.data[3] & 0x02) != 0) internalGnssActive = true;
		if((packet.data[3] & 0x04) != 0) magnetometersActive = true;
		if((packet.data[3] & 0x08) != 0) velocityHeadingActive = true;
		if((packet.data[3] & 0x10) != 0) atmosphericAltitudeActive = true;
		if((packet.data[3] & 0x20) != 0) externalPositionActive = true;
		if((packet.data[3] & 0x40) != 0) externalVelocityActive = true;
		if((packet.data[3] & 0x80) != 0) externalHeadingActive = true;
	}
	
	public ANPacket23(byte[] data, int offset)
	{
		if (data[offset] != 0)
		{
			statusAlert = true;
			if ((data[offset] & 0x01) != 0) systemFailure = true;
			if ((data[offset] & 0x02) != 0) accelerometerSensorFailure = true;
			if ((data[offset] & 0x04) != 0) gyroscopeSensorFailure = true;
			if ((data[offset] & 0x08) != 0) magnetometerSensorFailure = true;
			if ((data[offset] & 0x10) != 0) pressureSensorFailure = true;
			if ((data[offset] & 0x20) != 0) gnssFailure = true;
			if ((data[offset] & 0x40) != 0) accelerometerOverRange = true;
			if ((data[offset] & 0x80) != 0) gyroscopeOverRange = true;
		}
		if(data[offset + 1] != 0)
		{
			statusAlert = true;
			if ((data[offset + 1] & 0x01) != 0) magnetometerOverRange = true;
			if ((data[offset + 1] & 0x02) != 0) pressureOverRange = true;
			if ((data[offset + 1] & 0x04) != 0) minimumTemperatureAlarm = true;
			if ((data[offset + 1] & 0x08) != 0) maximumTemperatureAlarm = true;
			if ((data[offset + 1] & 0x10) != 0) lowVoltageAlarm = true;
			if ((data[offset + 1] & 0x20) != 0) highVoltageAlarm = true;
			if ((data[offset + 1] & 0x40) != 0) gnssAntennaAlarm = true;
			if ((data[offset + 1] & 0x80) != 0) dataOverflowAlarm = true;
		}
		if((data[offset + 2] & 0x01) != 0) orientationFilterInitialised = true;
		if((data[offset + 2] & 0x02) != 0) insFilterInitialised = true;
		if((data[offset + 2] & 0x04) != 0) headingInitialised = true;
		if((data[offset + 2] & 0x08) != 0) utcTimeValid = true;
		gnssFixType = (data[offset + 2] & 0x70)>>>4;
		if(gnssFixType > GNSS_NO_FIX) gnssFix = true;
		if((data[offset + 2] & 0x80) != 0) event1Flag = true;
		if((data[offset + 3] & 0x01) != 0) event2Flag = true;
		if((data[offset + 3] & 0x02) != 0) internalGnssActive = true;
		if((data[offset + 3] & 0x04) != 0) magnetometersActive = true;
		if((data[offset + 3] & 0x08) != 0) velocityHeadingActive = true;
		if((data[offset + 3] & 0x10) != 0) atmosphericAltitudeActive = true;
		if((data[offset + 3] & 0x20) != 0) externalPositionActive = true;
		if((data[offset + 3] & 0x40) != 0) externalVelocityActive = true;
		if((data[offset + 3] & 0x80) != 0) externalHeadingActive = true;
	}
}
