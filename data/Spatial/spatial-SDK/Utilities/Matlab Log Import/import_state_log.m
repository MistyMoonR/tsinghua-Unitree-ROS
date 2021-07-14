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

function state_data = import_state_log(filename)
    data = csvread('State.csv',1,1);
    state_data.unix_time_seconds = data(:,1) + data(:,2)/1000000;
    state_data.system_status.system_failure = data(:,3);
    state_data.system_status.accelerometer_failure = data(:,4);
    state_data.system_status.gyroscope_failure = data(:,5);
    state_data.system_status.magnetometer_failure = data(:,6);
    state_data.system_status.pressure_failure = data(:,7);
    state_data.system_status.gnss_failure = data(:,8);
    state_data.system_status.accelerometer_overrange = data(:,9);
    state_data.system_status.gyroscope_overrange = data(:,10);
    state_data.system_status.magnetometer_overrange = data(:,11);
    state_data.system_status.pressure_overrange = data(:,12);
    state_data.system_status.minimum_temperature = data(:,13);
    state_data.system_status.maximum_temperature = data(:,14);
    state_data.system_status.low_voltage = data(:,15);
    state_data.system_status.high_voltage = data(:,16);
    state_data.system_status.gnss_antenna_disconnected = data(:,17);
    state_data.system_status.data_overflow = data(:,18);
    state_data.filter_status.orientation_initialised = data(:,19);
    state_data.filter_status.navigation_filter_initialised = data(:,20);
    state_data.filter_status.heading_initialised = data(:,21);
    state_data.filter_status.utc_time_initialised = data(:,22);
    state_data.filter_status.gnss_fix_type = data(:,23);
    state_data.filter_status.event1_flag = data(:,24);
    state_data.filter_status.event2_flag = data(:,25);
    state_data.filter_status.internal_gnss_enabled = data(:,26);
    state_data.filter_status.magnetometers_enabled = data(:,27);
    state_data.filter_status.velocity_heading_enabled = data(:,28);
    state_data.filter_status.atmospheric_altitude_enabled = data(:,29);
    state_data.filter_status.external_positon_active = data(:,30);
    state_data.filter_status.external_velocity_active = data(:,31);
    state_data.filter_status.external_heading_active = data(:,32);
    state_data.position = data(:,33:35);
    state_data.velocity = data(:,36:38);
    state_data.acceleration = data(:,39:41);
    state_data.g_force = data(:,42);
    state_data.orientation = data(:,43:45);
    state_data.angular_velocity = data(:,46:48);
    state_data.position_error = data(:,49:51);
end
