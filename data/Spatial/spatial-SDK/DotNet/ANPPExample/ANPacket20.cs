/****************************************************************/
/*                                                              */
/*          Advanced Navigation Packet Protocol Library         */
/*          .NET C# Language Spatial SDK, Version 4.0           */
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ANPPExample
{
    class ANPacket20
    {
        public const int GNSS_NO_FIX = 0;
	    public const int GNSS_2D_FIX = 1;
	    public const int GNSS_3D_FIX = 2;
	    public const int GNSS_SBAS_FIX = 3;
	    public const int GNSS_DIFFERENTIAL_FIX = 4;
	    public const int GNSS_OMNISTAR_FIX = 5;
	    public const int GNSS_RTK_FLOAT_FIX = 6;
	    public const int GNSS_RTK_FIXED_FIX = 7;

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

        public Boolean orientationInitialised = false;
        public Boolean navigationInitialised = false;
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

        public UInt32 utc_time;
        public UInt32 microseconds;
        public DateTime time;

        public double[] position;
        public float[] velocity;
        public float[] acceleration;
        public float gForce;
        public float[] orientation;
        public float[] angularVelocity;
        public float[] positionStandardDeviation;

        public ANPacket20()
        {
            utc_time = 0;
            microseconds = 0;
            time = new DateTime(0);
            position = new double[3];
            position[0] = 0;
            position[1] = 0;
            position[2] = 0;
            velocity = new float[3];
            velocity[0] = 0;
            velocity[1] = 0;
            velocity[2] = 0;
            acceleration = new float[3];
            acceleration[0] = 0;
            acceleration[1] = 0;
            acceleration[2] = 0;
            gForce = 0;
            orientation = new float[3];
            orientation[0] = 0;
            orientation[1] = 0;
            orientation[2] = 0;
            angularVelocity = new float[3];
            angularVelocity[0] = 0;
            angularVelocity[1] = 0;
            angularVelocity[2] = 0;
            positionStandardDeviation = new float[3];
            positionStandardDeviation[0] = (float)1000000.0;
            positionStandardDeviation[1] = (float)1000000.0;
            positionStandardDeviation[2] = (float)1000000.0;
        }

        public ANPacket20(ANPacket packet)
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
            if (packet.data[1] != 0)
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
            if ((packet.data[2] & 0x01) != 0) orientationInitialised = true;
            if ((packet.data[2] & 0x02) != 0) navigationInitialised = true;
            if ((packet.data[2] & 0x04) != 0) headingInitialised = true;
            if ((packet.data[2] & 0x08) != 0) utcTimeValid = true;
            gnssFixType = (packet.data[2] & 0x70)>>4;
		    if(gnssFixType > GNSS_NO_FIX) gnssFix = true;
            if ((packet.data[2] & 0x80) != 0) event1Flag = true;
            if ((packet.data[3] & 0x01) != 0) event2Flag = true;
            if ((packet.data[3] & 0x02) != 0) internalGnssActive = true;
            if ((packet.data[3] & 0x04) != 0) magnetometersActive = true;
            if ((packet.data[3] & 0x08) != 0) velocityHeadingActive = true;
            if ((packet.data[3] & 0x10) != 0) atmosphericAltitudeActive = true;
            if ((packet.data[3] & 0x20) != 0) externalPositionActive = true;
            if ((packet.data[3] & 0x40) != 0) externalVelocityActive = true;
            if ((packet.data[3] & 0x80) != 0) externalHeadingActive = true;

            utc_time = BitConverter.ToUInt32(packet.data, 4);
            microseconds = BitConverter.ToUInt32(packet.data, 8);
            time = new DateTime(utc_time * 10000000 + microseconds * 10);

            position = new double[3];
            position[0] = BitConverter.ToDouble(packet.data, 12);
            position[1] = BitConverter.ToDouble(packet.data, 20);
            position[2] = BitConverter.ToDouble(packet.data, 28);

            velocity = new float[3];
            velocity[0] = BitConverter.ToSingle(packet.data, 36);
            velocity[1] = BitConverter.ToSingle(packet.data, 40);
            velocity[2] = BitConverter.ToSingle(packet.data, 44);

            acceleration = new float[3];
            acceleration[0] = BitConverter.ToSingle(packet.data, 48);
            acceleration[1] = BitConverter.ToSingle(packet.data, 52);
            acceleration[2] = BitConverter.ToSingle(packet.data, 56);
            gForce = BitConverter.ToSingle(packet.data, 60);

            orientation = new float[3];
            orientation[0] = BitConverter.ToSingle(packet.data, 64);
            orientation[1] = BitConverter.ToSingle(packet.data, 68);
            orientation[2] = BitConverter.ToSingle(packet.data, 72);

            angularVelocity = new float[3];
            angularVelocity[0] = BitConverter.ToSingle(packet.data, 76);
            angularVelocity[1] = BitConverter.ToSingle(packet.data, 80);
            angularVelocity[2] = BitConverter.ToSingle(packet.data, 84);

            positionStandardDeviation = new float[3];
            positionStandardDeviation[0] = BitConverter.ToSingle(packet.data, 88);
            positionStandardDeviation[1] = BitConverter.ToSingle(packet.data, 92);
            positionStandardDeviation[2] = BitConverter.ToSingle(packet.data, 96);
        }
    }
}
