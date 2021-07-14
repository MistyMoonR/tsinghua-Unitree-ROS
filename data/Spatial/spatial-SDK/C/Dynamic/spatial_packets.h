/****************************************************************/
/*                                                              */
/*          Advanced Navigation Packet Protocol Library         */
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

#ifdef __cplusplus
extern "C"
{
#endif

#define MAXIMUM_PACKET_PERIODS 50
#define MAXIMUM_DETAILED_SATELLITES 32

#define START_SYSTEM_PACKETS 0
#define START_STATE_PACKETS 20
#define START_CONFIGURATION_PACKETS 180

typedef enum
{
	packet_id_acknowledge,
	packet_id_request,
	packet_id_boot_mode,
	packet_id_device_information,
	packet_id_restore_factory_settings,
	packet_id_reset,
	packet_id_print,
	packet_id_file_transfer_request,
	packet_id_file_transfer_acknowledge,
	packet_id_file_transfer,
	packet_id_serial_port_passthrough,
	end_system_packets,

	packet_id_system_state = START_STATE_PACKETS,
	packet_id_unix_time,
	packet_id_formatted_time,
	packet_id_status,
	packet_id_position_standard_deviation,
	packet_id_velocity_standard_deviation,
	packet_id_euler_orientation_standard_deviation,
	packet_id_quaternion_orientation_standard_deviation,
	packet_id_raw_sensors,
	packet_id_raw_gnss,
	packet_id_satellites,
	packet_id_satellites_detailed,
	packet_id_geodetic_position,
	packet_id_ecef_position,
	packet_id_utm_position,
	packet_id_ned_velocity,
	packet_id_body_velocity,
	packet_id_acceleration,
	packet_id_body_acceleration,
	packet_id_euler_orientation,
	packet_id_quaternion_orientation,
	packet_id_dcm_orientation,
	packet_id_angular_velocity,
	packet_id_angular_acceleration,
	packet_id_external_position_velocity,
	packet_id_external_position,
	packet_id_external_velocity,
	packet_id_external_body_velocity,
	packet_id_external_heading,
	packet_id_running_time,
	packet_id_local_magnetics,
	packet_id_odometer_state,
	packet_id_external_time,
	packet_id_external_depth,
	packet_id_geoid_height,
	packet_id_rtcm_corrections,
	packet_id_external_pitot_pressure,
	packet_id_wind,
	packet_id_heave,
	packet_id_post_processing,
	packet_id_raw_satellite_data,
	packet_id_raw_satellite_ephemeris,
	packet_id_depth,
	packet_id_water_profiling,
	packet_id_external_usbl,
	packet_id_speed_of_sound,
	packet_id_lockheed,
	packet_id_external_odometer,
	packet_id_external_air_data,
	packet_id_gnss_receiver_information,
	end_state_packets,

	packet_id_packet_timer_period = START_CONFIGURATION_PACKETS,
	packet_id_packet_periods,
	packet_id_baud_rates,
	packet_id_bus_configuration,
	packet_id_sensor_ranges,
	packet_id_installation_alignment,
	packet_id_filter_options,
	packet_id_filter_trust,
	packet_id_gpio_configuration,
	packet_id_magnetic_calibration_values,
	packet_id_magnetic_calibration_configuration,
	packet_id_magnetic_calibration_status,
	packet_id_odometer_configuration,
	packet_id_zero_alignment,
	packet_id_heave_offset,
	packet_id_gpio_output_configuration,
	packet_id_dual_antenna_configuration,
	end_configuration_packets
} packet_id_e;

/* start of system packets typedef structs */

typedef enum
{
	acknowledge_success,
	acknowledge_failure_crc,
	acknowledge_failure_length,
	acknowledge_failure_range,
	acknowledge_failure_flash,
	acknowledge_failure_not_ready,
	acknowledge_failure_unknown_packet
} acknowledge_result_e;

typedef struct
{
	uint8_t packet_id;
	uint16_t packet_crc;
	uint8_t acknowledge_result;
} acknowledge_packet_t;

typedef enum
{
	boot_mode_bootloader,
	boot_mode_main_program
} boot_mode_e;

typedef struct
{
	uint8_t boot_mode;
} boot_mode_packet_t;

typedef struct
{
	uint32_t software_version;
	uint32_t device_id;
	uint32_t hardware_revision;
	uint32_t serial_number[3];
} device_information_packet_t;

typedef enum
{
	data_encoding_binary,
	data_encoding_aes256
} data_encoding_e;

typedef enum
{
	file_transfer_response_completed_successfully,
	file_transfer_response_ready,
	file_transfer_response_index_mismatch,
	file_transfer_response_refused = 64,
	file_transfer_response_bad_metadata,
	file_transfer_response_timeout,
	file_transfer_response_retry_error,
	file_transfer_response_storage_error,
	file_transfer_response_data_invalid,
	file_transfer_response_packet_length_invalid,
	file_transfer_response_total_size_invalid,
	file_transfer_response_overflow_error,
	file_transfer_response_busy,
	file_transfer_response_cancelled,
	file_transfer_response_file_not_found = 128,
	file_transfer_response_access_denied
} file_transfer_response_e;

typedef enum
{
	file_transfer_metadata_none,
	file_transfer_metadata_extended_anpp,
	file_transfer_metadata_utf8_filename,
	file_transfer_metadata_an_firmware
} file_transfer_metadata_e;

typedef struct
{
	uint32_t unique_id;
	uint32_t data_index;
	uint8_t response_code;
} file_transfer_acknowledge_packet_t;

typedef struct
{
	uint32_t unique_id;
	uint32_t data_index;
	uint32_t total_size;
	uint8_t data_encoding;
	uint8_t metadata_type;
	uint8_t *metadata;
	uint8_t *packet_data;
} file_transfer_first_packet_t;

typedef struct
{
	uint32_t unique_id;
	uint32_t data_index;
	uint8_t *packet_data;
} file_transfer_ongoing_packet_t;

/* start of state packets typedef structs */

typedef enum
{
	gnss_fix_none,
	gnss_fix_2d,
	gnss_fix_3d,
	gnss_fix_sbas,
	gnss_fix_differential,
	gnss_fix_omnistar,
	gnss_fix_rtk_float,
	gnss_fix_rtk_fixed
} gnss_fix_type_e;

typedef struct
{
	union
	{
		uint16_t r;
		struct
		{
			unsigned int system_failure :1;
			unsigned int accelerometer_sensor_failure :1;
			unsigned int gyroscope_sensor_failure :1;
			unsigned int magnetometer_sensor_failure :1;
			unsigned int pressure_sensor_failure :1;
			unsigned int gnss_failure :1;
			unsigned int accelerometer_over_range :1;
			unsigned int gyroscope_over_range :1;
			unsigned int magnetometer_over_range :1;
			unsigned int pressure_over_range :1;
			unsigned int minimum_temperature_alarm :1;
			unsigned int maximum_temperature_alarm :1;
			unsigned int low_voltage_alarm :1;
			unsigned int high_voltage_alarm :1;
			unsigned int gnss_antenna_disconnected :1;
			unsigned int serial_port_overflow_alarm :1;
		} b;
	} system_status;
	union
	{
		uint16_t r;
		struct
		{
			unsigned int orientation_filter_initialised :1;
			unsigned int ins_filter_initialised :1;
			unsigned int heading_initialised :1;
			unsigned int utc_time_initialised :1;
			unsigned int gnss_fix_type :3;
			unsigned int event1_flag :1;
			unsigned int event2_flag :1;
			unsigned int internal_gnss_enabled :1;
			unsigned int magnetic_heading_enabled :1;
			unsigned int velocity_heading_enabled :1;
			unsigned int atmospheric_altitude_enabled :1;
			unsigned int external_position_active :1;
			unsigned int external_velocity_active :1;
			unsigned int external_heading_active :1;
		} b;
	} filter_status;
	uint32_t unix_time_seconds;
	uint32_t microseconds;
	double latitude;
	double longitude;
	double height;
	float velocity[3];
	float body_acceleration[3];
	float g_force;
	float orientation[3];
	float angular_velocity[3];
	float standard_deviation[3];
} system_state_packet_t;

typedef struct
{
	uint32_t unix_time_seconds;
	uint32_t microseconds;
} unix_time_packet_t;

typedef struct
{
	uint32_t microseconds;
	uint16_t year;
	uint16_t year_day;
	uint8_t month;
	uint8_t month_day;
	uint8_t week_day;
	uint8_t hour;
	uint8_t minute;
	uint8_t second;
} formatted_time_packet_t;

typedef struct
{
	union
	{
		uint16_t r;
		struct
		{
			unsigned int system_failure :1;
			unsigned int accelerometer_sensor_failure :1;
			unsigned int gyroscope_sensor_failure :1;
			unsigned int magnetometer_sensor_failure :1;
			unsigned int pressure_sensor_failure :1;
			unsigned int gnss_failure :1;
			unsigned int accelerometer_over_range :1;
			unsigned int gyroscope_over_range :1;
			unsigned int magnetometer_over_range :1;
			unsigned int pressure_over_range :1;
			unsigned int minimum_temperature_alarm :1;
			unsigned int maximum_temperature_alarm :1;
			unsigned int low_voltage_alarm :1;
			unsigned int high_voltage_alarm :1;
			unsigned int gnss_antenna_disconnected :1;
			unsigned int serial_port_overflow_alarm :1;
		} b;
	} system_status;
	union
	{
		uint16_t r;
		struct
		{
			unsigned int orientation_filter_initialised :1;
			unsigned int ins_filter_initialised :1;
			unsigned int heading_initialised :1;
			unsigned int utc_time_initialised :1;
			unsigned int gnss_fix_type :3;
			unsigned int event1_flag :1;
			unsigned int event2_flag :1;
			unsigned int internal_gnss_enabled :1;
			unsigned int dual_antenna_heading_active :1;
			unsigned int velocity_heading_enabled :1;
			unsigned int atmospheric_altitude_enabled :1;
			unsigned int external_position_active :1;
			unsigned int external_velocity_active :1;
			unsigned int external_heading_active :1;
		} b;
	} filter_status;
} status_packet_t;

typedef struct
{
	float standard_deviation[3];
} position_standard_deviation_packet_t;

typedef struct
{
	float standard_deviation[3];
} velocity_standard_deviation_packet_t;

typedef struct
{
	float standard_deviation[3];
} euler_orientation_standard_deviation_packet_t;

typedef struct
{
	float standard_deviation[4];
} quaternion_orientation_standard_deviation_packet_t;

typedef struct
{
	float accelerometers[3];
	float gyroscopes[3];
	float magnetometers[3];
	float imu_temperature;
	float pressure;
	float pressure_temperature;
} raw_sensors_packet_t;

typedef struct
{
	uint32_t unix_time_seconds;
	uint32_t microseconds;
	double position[3];
	float velocity[3];
	float position_standard_deviation[3];
	float tilt; /* This field will only be valid if an external dual antenna GNSS system is connected */
	float heading; /* This field will only be valid if an external dual antenna GNSS system is connected */
	float tilt_standard_deviation; /* This field will only be valid if an external dual antenna GNSS system is connected */
	float heading_standard_deviation; /* This field will only be valid if an external dual antenna GNSS system is connected */
	union
	{
		uint16_t r;
		struct
		{
			unsigned int fix_type:3;
			unsigned int velocity_valid:1;
			unsigned int time_valid:1;
			unsigned int external_gnss:1;
			unsigned int tilt_valid:1; /* This field will only be valid if an external dual antenna GNSS system is connected */
			unsigned int heading_valid:1; /* This field will only be valid if an external dual antenna GNSS system is connected */
		} b;
	} flags;
} raw_gnss_packet_t;

typedef struct
{
	float hdop;
	float vdop;
	uint8_t gps_satellites;
	uint8_t glonass_satellites;
	uint8_t beidou_satellites;
	uint8_t galileo_satellites;
	uint8_t sbas_satellites;
} satellites_packet_t;

typedef enum
{
	satellite_system_unknown,
	satellite_system_gps,
	satellite_system_glonass,
	satellite_system_beidou,
	satellite_system_galileo,
	satellite_system_sbas,
	satellite_system_qzss,
	satellite_system_starfire,
	satellite_system_omnistar
} satellite_system_e;

typedef struct
{
	uint8_t satellite_system;
	uint8_t number;
	union
	{
		uint8_t r;
		struct
		{
			unsigned int l1_ca :1;
			unsigned int l1_c :1;
			unsigned int l1_p :1;
			unsigned int l1_m :1;
			unsigned int l2_c :1;
			unsigned int l2_p :1;
			unsigned int l2_m :1;
			unsigned int l5 :1;
		} b;
	} frequencies;
	uint8_t elevation;
	uint16_t azimuth;
	uint8_t snr;
} satellite_t;

typedef struct
{
	satellite_t satellites[MAXIMUM_DETAILED_SATELLITES];
} detailed_satellites_packet_t;

typedef struct
{
	double position[3];
} geodetic_position_packet_t;

typedef struct
{
	double position[3];
} ecef_position_packet_t;

typedef struct
{
	double position[3];
	char zone;
} utm_position_packet_t;

typedef struct
{
	float velocity[3];
} ned_velocity_packet_t;

typedef struct
{
	float velocity[3];
} body_velocity_packet_t;

typedef struct
{
	float acceleration[3];
} acceleration_packet_t;

typedef struct
{
	float acceleration[3];
	float g_force;
} body_acceleration_packet_t;

typedef struct
{
	float orientation[3];
} euler_orientation_packet_t;

typedef struct
{
	float orientation[4];
} quaternion_orientation_packet_t;

typedef struct
{
	float orientation[3][3];
} dcm_orientation_packet_t;

typedef struct
{
	float angular_velocity[3];
} angular_velocity_packet_t;

typedef struct
{
	float angular_acceleration[3];
} angular_acceleration_packet_t;

typedef struct
{
	double position[3];
	float velocity[3];
	float position_standard_deviation[3];
	float velocity_standard_deviation[3];
} external_position_velocity_packet_t;

typedef struct
{
	double position[3];
	float standard_deviation[3];
} external_position_packet_t;

typedef struct
{
	float velocity[3];
	float standard_deviation[3];
} external_velocity_packet_t;

typedef struct
{
	float velocity[3];
	float standard_deviation;
} external_body_velocity_packet_t;

typedef struct
{
	float heading;
	float standard_deviation;
} external_heading_packet_t;

typedef struct
{
	uint32_t seconds;
	uint32_t microseconds;
} running_time_packet_t;

typedef struct
{
	float magnetic_field[3];
} local_magnetics_packet_t;

typedef struct
{
	uint32_t pulse_count;
	float distance;
	float speed;
	float slip;
	uint8_t active;
} odometer_state_packet_t;

typedef struct
{
	uint32_t unix_time_seconds;
	uint32_t microseconds;
} external_time_packet_t;

typedef struct
{
	float depth;
	float standard_deviation;
} external_depth_packet_t;

typedef struct
{
	float geoid_height;
} geoid_height_packet_t;

typedef struct
{
	float differential_pressure;
	float outside_air_temperature;
} external_pitot_pressure_packet_t;

typedef struct
{
	float wind_velocity[2];
	float wind_standard_deviation;
} wind_packet_t;

typedef struct
{
	float heave_point_1;
	float heave_point_2;
	float heave_point_3;
	float heave_point_4;
} heave_packet_t;

typedef struct
{
	float delay;
	float speed;
	float distance_travelled;
	union
	{
		uint8_t r;
		struct
		{
			unsigned int reverse_detection_supported:1;
		} b;
	} flags;
} odometer_packet_t;

typedef struct
{
	float altitude_delay;
	float airspeed_delay;
	float altitude;
	float airspeed;
	float altitude_standard_deviation;
	float airspeed_standard_deviation;
	union
	{
		uint8_t r;
		struct
		{
			unsigned int altitude_set :1;
			unsigned int airspeed_set :1;
			unsigned int reset_qnh :1;
		} b;
	} flags;
} external_air_data_packet_t;

/* start of configuration packets typedef structs */

typedef struct
{
	uint8_t permanent;
	uint8_t utc_synchronisation;
	uint16_t packet_timer_period;
} packet_timer_period_packet_t;

typedef struct
{
	uint8_t packet_id;
	uint32_t period;
} packet_period_t;

typedef struct
{
	uint8_t permanent;
	uint8_t clear_existing_packets;
	packet_period_t packet_periods[MAXIMUM_PACKET_PERIODS];
} packet_periods_packet_t;

typedef struct
{
	uint8_t permanent;
	uint32_t primary_baud_rate;
	uint32_t gpio_1_2_baud_rate;
	uint32_t auxiliary_baud_rate;
	uint32_t reserved;
} baud_rates_packet_t;

typedef enum
{
	accelerometer_range_2g,
	accelerometer_range_4g,
	accelerometer_range_16g
} accelerometer_range_e;

typedef enum
{
	gyroscope_range_250dps,
	gyroscope_range_500dps,
	gyroscope_range_2000dps
} gyroscope_range_e;

typedef enum
{
	magnetometer_range_2g,
	magnetometer_range_4g,
	magnetometer_range_8g
} magnetometer_range_e;

typedef struct
{
	uint8_t permanent;
	uint8_t accelerometers_range;
	uint8_t gyroscopes_range;
	uint8_t magnetometers_range;
} sensor_ranges_packet_t;

typedef struct
{
	uint8_t permanent;
	float alignment_dcm[3][3];
	float gnss_antenna_offset[3];
	float odometer_offset[3];
	float external_data_offset[3];
} installation_alignment_packet_t;

typedef enum
{
	vehicle_type_unlimited,
	vehicle_type_bicycle,
	vehicle_type_car,
	vehicle_type_hovercraft,
	vehicle_type_submarine,
	vehicle_type_3d_underwater,
	vehicle_type_fixed_wing_plane,
	vehicle_type_3d_aircraft,
	vehicle_type_human,
	vehicle_type_small_boat,
	vehicle_type_ship,
	vehicle_type_stationary,
	vehicle_type_stunt_plane
} vehicle_type_e;

typedef struct
{
	uint8_t permanent;
	uint8_t vehicle_type;
	uint8_t internal_gnss_enabled;
	uint8_t magnetometers_enabled;
	uint8_t atmospheric_altitude_enabled;
	uint8_t velocity_heading_enabled;
	uint8_t reversing_detection_enabled;
	uint8_t motion_analysis_enabled;
	uint8_t automatic_magnetic_calibration_enabled;
} filter_options_packet_t;

typedef enum
{
	inactive,
	pps_output,
	gnss_fix_output,
	odometer_input,
	stationary_input,
	pitot_tube_input,
	nmea_input,
	nmea_output,
	novatel_gnss_input,
	topcon_gnss_input,
	motec_output,
	anpp_input,
	anpp_output,
	disable_magnetometers,
	disable_gnss,
	disable_pressure,
	set_zero_alignment,
	packet_trigger_system_state,
	packet_trigger_raw_sensors,
	rtcm_corrections_input,
	trimble_gnss_input,
	ublox_gnss_input,
	hemisphere_gnss_input,
	teledyne_dvl_input,
	tritech_usbl_input,
	linkquest_dvl_input,
	pressure_depth_sensor,
	left_wheel_speed_sensor,
	right_wheel_speed_sensor,
	pps_input,
	wheel_speed_sensor,
	wheel_encoder_phase_a,
	wheel_encoder_phase_b,
	event1_input,
	event2_input,
	linkquest_usbl_input,
	ixblue_input,
	sonardyne_input
} gpio_function_e;

typedef enum
{
	gpio1,
	gpio2,
	auxiliary_tx,
	auxiliary_rx
} gpio_index_e;

typedef struct
{
	uint8_t permanent;
	uint8_t gpio_function[4];
} gpio_configuration_packet_t;

typedef struct
{
	uint8_t permanent;
	float hard_iron[3];
	float soft_iron[3][3];
} magnetic_calibration_values_packet_t;

typedef enum
{
	magnetic_calibration_action_cancel,
	magnetic_calibration_action_stabilise,
	magnetic_calibration_action_start_2d,
	magnetic_calibration_action_start_3d
} magnetic_calibration_action_e;

typedef struct
{
	uint8_t magnetic_calibration_action;
} magnetic_calibration_configuration_packet_t;

typedef enum
{
	magnetic_calibration_status_not_completed,
	magnetic_calibration_status_completed_2d,
	magnetic_calibration_status_completed_3d,
	magnetic_calibration_status_completed_user,
	magnetic_calibration_status_stabilizing,
	magnetic_calibration_status_in_progress_2d,
	magnetic_calibration_status_in_progress_3d,
	magnetic_calibration_status_error_excessive_roll,
	magnetic_calibration_status_error_excessive_pitch,
	magnetic_calibration_status_error_overrange_event,
	magnetic_calibration_status_error_timeout,
	magnetic_calibration_status_error_system
} magnetic_calibration_status_e;

typedef struct
{
	uint8_t magnetic_calibration_status;
	uint8_t magnetic_calibration_progress_percentage;
	uint8_t local_magnetic_error_percentage;
} magnetic_calibration_status_packet_t;

typedef struct
{
	uint8_t permanent;
	uint8_t automatic_calibration;
	float pulse_length;
} odometer_configuration_packet_t;

typedef struct
{
	uint8_t permanent;
} zero_alignment_packet_t;

typedef struct
{
	uint8_t permanent;
	float heave_point_1_offset[3];
	float heave_point_2_offset[3];
	float heave_point_3_offset[3];
	float heave_point_4_offset[3];
} heave_offset_packet_t;

typedef enum
{
	gpio_rate_disabled,
	gpio_rate_0o1hz,
	gpio_rate_0o2hz,
	gpio_rate_0o5hz,
	gpio_rate_1hz,
	gpio_rate_2hz,
	gpio_rate_5hz,
	gpio_rate_10hz,
	gpio_rate_25hz,
	gpio_rate_50hz
} gpio_rate_e;

typedef enum
{
	nmea_fix_behaviour_normal,
	nmea_fix_behaviour_always_3d
} nmea_fix_behaviour_e;

typedef union
{
	uint16_t r;
	struct
	{
		unsigned int gpio1_rate:4;
		unsigned int auxiliary_rate:4;
	} b;
} gpio_output_rate_u;

typedef struct
{
	uint8_t permanent;
	uint8_t nmea_fix_behaviour;
	gpio_output_rate_u gpzda_rate;
	gpio_output_rate_u gpgga_rate;
	gpio_output_rate_u gpvtg_rate;
	gpio_output_rate_u gprmc_rate;
	gpio_output_rate_u gphdt_rate;
	gpio_output_rate_u gpgll_rate;
	gpio_output_rate_u pashr_rate;
	gpio_output_rate_u tss1_rate;
	gpio_output_rate_u simrad_rate;
	uint8_t reserved[13];
} gpio_output_configuration_packet_t;

int decode_acknowledge_packet(acknowledge_packet_t *acknowledge_packet, an_packet_t *an_packet);
an_packet_t *encode_request_packet(uint8_t requested_packet_id);
int decode_boot_mode_packet(boot_mode_packet_t *boot_mode_packet, an_packet_t *an_packet);
an_packet_t *encode_boot_mode_packet(boot_mode_packet_t *boot_mode_packet);
int decode_device_information_packet(device_information_packet_t *device_information_packet, an_packet_t *an_packet);
an_packet_t *encode_restore_factory_settings_packet();
an_packet_t *encode_reset_packet();
int decode_file_transfer_acknowledge_packet(file_transfer_acknowledge_packet_t *file_transfer_acknowledge_packet, an_packet_t *an_packet);
int decode_system_state_packet(system_state_packet_t *system_state_packet, an_packet_t *an_packet);
int decode_unix_time_packet(unix_time_packet_t *unix_time_packet, an_packet_t *an_packet);
int decode_formatted_time_packet(formatted_time_packet_t *formatted_time_packet, an_packet_t *an_packet);
int decode_status_packet(status_packet_t *status_packet, an_packet_t *an_packet);
int decode_position_standard_deviation_packet(position_standard_deviation_packet_t *position_standard_deviation_packet, an_packet_t *an_packet);
int decode_velocity_standard_deviation_packet(velocity_standard_deviation_packet_t *velocity_standard_deviation_packet, an_packet_t *an_packet);
int decode_euler_orientation_standard_deviation_packet(euler_orientation_standard_deviation_packet_t *euler_orientation_standard_deviation, an_packet_t *an_packet);
int decode_quaternion_orientation_standard_deviation_packet(quaternion_orientation_standard_deviation_packet_t *quaternion_orientation_standard_deviation_packet, an_packet_t *an_packet);
int decode_raw_sensors_packet(raw_sensors_packet_t *raw_sensors_packet, an_packet_t *an_packet);
int decode_raw_gnss_packet(raw_gnss_packet_t *raw_gnss_packet, an_packet_t *an_packet);
int decode_satellites_packet(satellites_packet_t *satellites_packet, an_packet_t *an_packet);
int decode_detailed_satellites_packet(detailed_satellites_packet_t *detailed_satellites_packet, an_packet_t *an_packet);
int decode_geodetic_position_packet(geodetic_position_packet_t *geodetic_position_packet, an_packet_t *an_packet);
int decode_ecef_position_packet(ecef_position_packet_t *ecef_position_packet, an_packet_t *an_packet);
int decode_utm_position_packet(utm_position_packet_t *utm_position_packet, an_packet_t *an_packet);
int decode_ned_velocity_packet(ned_velocity_packet_t *ned_velocity_packet, an_packet_t *an_packet);
int decode_body_velocity_packet(body_velocity_packet_t *body_velocity_packet, an_packet_t *an_packet);
int decode_acceleration_packet(acceleration_packet_t *acceleration, an_packet_t *an_packet);
int decode_body_acceleration_packet(body_acceleration_packet_t *body_acceleration, an_packet_t *an_packet);
int decode_euler_orientation_packet(euler_orientation_packet_t *euler_orientation_packet, an_packet_t *an_packet);
int decode_quaternion_orientation_packet(quaternion_orientation_packet_t *quaternion_orientation_packet, an_packet_t *an_packet);
int decode_dcm_orientation_packet(dcm_orientation_packet_t *dcm_orientation_packet, an_packet_t *an_packet);
int decode_angular_velocity_packet(angular_velocity_packet_t *angular_velocity_packet, an_packet_t *an_packet);
int decode_angular_acceleration_packet(angular_acceleration_packet_t *angular_acceleration_packet, an_packet_t *an_packet);
int decode_external_position_velocity_packet(external_position_velocity_packet_t *external_position_velocity_packet, an_packet_t *an_packet);
an_packet_t *encode_external_position_velocity_packet(external_position_velocity_packet_t *external_position_velocity_packet);
int decode_external_position_packet(external_position_packet_t *external_position_packet, an_packet_t *an_packet);
an_packet_t *encode_external_position_packet(external_position_packet_t *external_position_packet);
int decode_external_velocity_packet(external_velocity_packet_t *external_velocity_packet, an_packet_t *an_packet);
an_packet_t *encode_external_velocity_packet(external_velocity_packet_t *external_velocity_packet);
int decode_external_body_velocity_packet(external_body_velocity_packet_t *external_body_velocity_packet, an_packet_t *an_packet);
an_packet_t *encode_external_body_velocity_packet(external_body_velocity_packet_t *external_body_velocity_packet);
int decode_external_heading_packet(external_heading_packet_t *external_heading_packet, an_packet_t *an_packet);
an_packet_t *encode_external_heading_packet(external_heading_packet_t *external_heading_packet);
int decode_running_time_packet(running_time_packet_t *running_time_packet, an_packet_t *an_packet);
int decode_local_magnetics_packet(local_magnetics_packet_t *local_magnetics_packet, an_packet_t *an_packet);
int decode_odometer_state_packet(odometer_state_packet_t *odometer_state_packet, an_packet_t *an_packet);
int decode_external_time_packet(external_time_packet_t *external_time_packet, an_packet_t *an_packet);
an_packet_t *encode_external_time_packet(external_time_packet_t *external_time_packet);
int decode_external_depth_packet(external_depth_packet_t *external_depth_packet, an_packet_t *an_packet);
an_packet_t *encode_external_depth_packet(external_depth_packet_t *external_depth_packet);
int decode_geoid_height_packet(geoid_height_packet_t *geoid_height_packet, an_packet_t *an_packet);
int decode_external_pitot_pressure_packet(external_pitot_pressure_packet_t *external_pitot_pressure_packet, an_packet_t *an_packet);
an_packet_t *encode_external_pitot_pressure_packet(external_pitot_pressure_packet_t *external_pitot_pressure_packet);
int decode_wind_packet(wind_packet_t *wind_packet, an_packet_t *an_packet);
an_packet_t *encode_wind_packet(wind_packet_t *wind_packet);
int decode_heave_packet(heave_packet_t *heave_packet, an_packet_t *an_packet);
int decode_odometer_packet(odometer_packet_t *external_odometer_packet, an_packet_t *an_packet);
an_packet_t *encode_external_odometer_packet(odometer_packet_t *external_odometer_packet);
int decode_external_air_data_packet(external_air_data_packet_t *external_air_data_packet, an_packet_t *an_packet);
an_packet_t *encode_external_air_data_packet(external_air_data_packet_t *external_air_data_packet);
int decode_packet_timer_period_packet(packet_timer_period_packet_t *packet_timer_period_packet, an_packet_t *an_packet);
an_packet_t *encode_packet_timer_period_packet(packet_timer_period_packet_t *packet_timer_period_packet);
int decode_packet_periods_packet(packet_periods_packet_t *packet_periods_packet, an_packet_t *an_packet);
an_packet_t *encode_packet_periods_packet(packet_periods_packet_t *packet_periods_packet);
int decode_baud_rates_packet(baud_rates_packet_t *baud_rates_packet, an_packet_t *an_packet);
an_packet_t *encode_baud_rates_packet(baud_rates_packet_t *baud_rates_packet);
int decode_sensor_ranges_packet(sensor_ranges_packet_t *sensor_ranges_packet, an_packet_t *an_packet);
an_packet_t *encode_sensor_ranges_packet(sensor_ranges_packet_t *sensor_ranges_packet);
int decode_installation_alignment_packet(installation_alignment_packet_t *installation_alignment_packet, an_packet_t *an_packet);
an_packet_t *encode_installation_alignment_packet(installation_alignment_packet_t *installation_alignment_packet);
int decode_filter_options_packet(filter_options_packet_t *filter_options_packet, an_packet_t *an_packet);
an_packet_t *encode_filter_options_packet(filter_options_packet_t *filter_options_packet);
int decode_gpio_configuration_packet(gpio_configuration_packet_t *gpio_configuration_packet, an_packet_t *an_packet);
an_packet_t *encode_gpio_configuration_packet(gpio_configuration_packet_t *gpio_configuration_packet);
int decode_magnetic_calibration_values_packet(magnetic_calibration_values_packet_t *magnetic_calibration_values_packet, an_packet_t *an_packet);
an_packet_t *encode_magnetic_calibration_values_packet(magnetic_calibration_values_packet_t *magnetic_calibration_values_packet);
an_packet_t *encode_magnetic_calibration_configuration_packet(magnetic_calibration_configuration_packet_t *magnetic_calibration_configuration_packet);
int decode_magnetic_calibration_status_packet(magnetic_calibration_status_packet_t *magnetic_calibration_status_packet, an_packet_t *an_packet);
int decode_odometer_configuration_packet(odometer_configuration_packet_t *odometer_configuration_packet, an_packet_t *an_packet);
an_packet_t *encode_odometer_configuration_packet(odometer_configuration_packet_t *odometer_configuration_packet);
an_packet_t *encode_zero_alignment_packet(zero_alignment_packet_t *zero_alignment_packet);
int decode_heave_offset_packet(heave_offset_packet_t *heave_offset_packet, an_packet_t *an_packet);
an_packet_t *encode_heave_offset_packet(heave_offset_packet_t *heave_offset_packet);
int decode_gpio_output_configuration_packet(gpio_output_configuration_packet_t *gpio_output_configuration_packet, an_packet_t *an_packet);
an_packet_t *encode_gpio_output_configuration_packet(gpio_output_configuration_packet_t *gpio_output_configuration_packet);

#ifdef __cplusplus
}
#endif
