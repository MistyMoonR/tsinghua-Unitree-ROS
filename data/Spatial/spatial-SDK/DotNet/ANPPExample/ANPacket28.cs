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
    class ANPacket28
    {
        public float[] accelerometers;
        public float[] gyroscopes;
        public float[] magnetometers;
        public float imuTemperature;
        public float pressure;
        public float pressureTemperature;

        public ANPacket28()
        {
            accelerometers = new float[3];
            accelerometers[0] = 0;
            accelerometers[1] = 0;
            accelerometers[2] = 0;
            gyroscopes = new float[3];
            gyroscopes[0] = 0;
            gyroscopes[1] = 0;
            gyroscopes[2] = 0;
            magnetometers = new float[3];
            magnetometers[0] = 0;
            magnetometers[1] = 0;
            magnetometers[2] = 0;
            imuTemperature = 0;
            pressure = 0;
            pressureTemperature = 0;
        }

        public ANPacket28(ANPacket packet)
        {
            accelerometers = new float[3];
            accelerometers[0] = BitConverter.ToSingle(packet.data, 0);
            accelerometers[1] = BitConverter.ToSingle(packet.data, 4);
            accelerometers[2] = BitConverter.ToSingle(packet.data, 8);
            gyroscopes = new float[3];
            gyroscopes[0] = BitConverter.ToSingle(packet.data, 12);
            gyroscopes[1] = BitConverter.ToSingle(packet.data, 16);
            gyroscopes[2] = BitConverter.ToSingle(packet.data, 20);
            magnetometers = new float[3];
            magnetometers[0] = BitConverter.ToSingle(packet.data, 24);
            magnetometers[1] = BitConverter.ToSingle(packet.data, 28);
            magnetometers[2] = BitConverter.ToSingle(packet.data, 32);
            imuTemperature = BitConverter.ToSingle(packet.data, 36);
            pressure = BitConverter.ToSingle(packet.data, 40);
            pressureTemperature = BitConverter.ToSingle(packet.data, 44);
        }
    }
}
