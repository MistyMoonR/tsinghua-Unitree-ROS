% /****************************************************************/
% /*                                                              */
% /*      Advanced Navigation Packet Protocol Library             */
% /*            Matlab Log Import, Version 4.0                    */
% /*   Copyright 2014, Xavier Orr, Advanced Navigation Pty Ltd    */
% /*                                                              */
% /****************************************************************/
% /*
% * Copyright (C) 2014 Advanced Navigation Pty Ltd
% *
% * Permission is hereby granted, free of charge, to any person obtaining
% * a copy of this software and associated documentation files (the "Software"),
% * to deal in the Software without restriction, including without limitation
% * the rights to use, copy, modify, merge, publish, distribute, sublicense,
% * and/or sell copies of the Software, and to permit persons to whom the
% * Software is furnished to do so, subject to the following conditions:
% *
% * The above copyright notice and this permission notice shall be included
% * in all copies or substantial portions of the Software.
% *
% * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
% * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
% * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
% * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
% * DEALINGS IN THE SOFTWARE.
% */

function sensor_data = import_sensor_log()
    data = csvread('RawSensors.csv', 1, 1);
    sensor_data.unix_time_seconds = data(:,1) + data(:,2)/1000000;
    sensor_data.accelerometers = data(:,3:5);
    sensor_data.gyroscopes = data(:,6:8);
    sensor_data.magnetometers = data(:,9:11);
    sensor_data.imu_temperature = data(:,12);
    sensor_data.pressure = data(:,13);
    sensor_data.pressure_temperature = data(:,14);
end
